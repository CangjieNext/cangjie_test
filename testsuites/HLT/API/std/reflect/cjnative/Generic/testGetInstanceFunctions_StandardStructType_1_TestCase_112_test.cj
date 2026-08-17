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
class testGetInstanceFunctions_StandardStructType_1 {
    @TestCase
    func TestCase_112(): Unit {
        // logger.info("testcase TestCase_112 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt64, UInt64, Int8>>().getInstanceFunctions("classInstanceMemberFunction_113").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt64, UInt64, Int8>>()
            .getInstanceFunctions("classInstanceMemberFunction_113")[0i64]
            .apply(StandardStructType<UInt64, UInt64, Int8>(),
                [TypeInfo.of<UInt8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Bool>()],
                [123u64, GenericClassWith1TypeParameters<UInt16>(), NonGenericClass()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_113")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<Bool>()],
                    [123u64, GenericClassWith1TypeParameters<UInt16>(), NonGenericClass()])
            @Expect("assertion#3546: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_113")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<UInt16>()],
                    [123u64, GenericClassWith1TypeParameters<UInt16>(), NonGenericClass()])
            @Expect("assertion#3547: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_113")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Bool>()],
                    [GenericClassWith1TypeParameters<UInt16>(), NonGenericClass()])
            @Expect("assertion#3548: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_113")[0i64]
                .apply(StandardStructType<UInt64, UInt64, Int8>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Bool>()],
                    [GenericClassWith1TypeParameters<UInt16>(), NonGenericClass()])
            @Expect("assertion#3549: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_113")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Bool>(),
                    TypeInfo.of<Float64>()], [GenericClassWith1TypeParameters<UInt16>(), NonGenericClass()])
            @Expect("assertion#3550: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_113")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Bool>()],
                    [123u64, GenericClassWith1TypeParameters<UInt16>()])
            @Expect("assertion#3551: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_113")[0i64]
                .apply(StandardStructType<UInt64, UInt64, Int8>(), [TypeInfo.of<UInt8>(), TypeInfo.of<UInt16>()],
                    [123u64, GenericClassWith1TypeParameters<UInt16>()])
            @Expect("assertion#3552: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_113")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [123u64, GenericClassWith1TypeParameters<UInt16>()])
            @Expect("assertion#3553: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_113")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<Bool>()],
                    [123u64, GenericClassWith1TypeParameters<UInt16>(), NonGenericClass(), 114.514000f64])
            @Expect("assertion#3554: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_113")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<UInt16>()],
                    [123u64, GenericClassWith1TypeParameters<UInt16>(), NonGenericClass(), 114.514000f64])
            @Expect("assertion#3555: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_113")[0i64]
                .apply(StandardStructType<UInt64, UInt64, Int8>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [123u64, GenericClassWith1TypeParameters<UInt16>(), NonGenericClass(), 114.514000f64])
            @Expect("assertion#3556: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_113")[0i64]
                .apply(StandardStructType<UInt64, UInt64, Int8>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Bool>()],
                    [114.514000f64, GenericClassWith1TypeParameters<UInt16>(), NonGenericClass()])
            @Expect("assertion#3557: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_113")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<Bool>()],
                    [114.514000f64, GenericClassWith1TypeParameters<UInt16>(), NonGenericClass()])
            @Expect("assertion#3558: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_113")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<UInt16>()],
                    [114.514000f64, GenericClassWith1TypeParameters<UInt16>(), NonGenericClass()])
            @Expect("assertion#3559: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_113")[0i64]
                .apply(StandardStructType<UInt64, UInt64, Int8>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Bool>()], [123u64, (), NonGenericClass()])
            @Expect("assertion#3560: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_113")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<Bool>()], [123u64, (), NonGenericClass()])
            @Expect("assertion#3561: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_113")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<UInt16>()], [123u64, (), NonGenericClass()])
            @Expect("assertion#3562: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_113")[0i64]
                .apply(StandardStructType<UInt64, UInt64, Int8>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Bool>()],
                    [123u64, GenericClassWith1TypeParameters<UInt16>(), ()])
            @Expect("assertion#3563: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_113")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<Bool>()],
                    [123u64, GenericClassWith1TypeParameters<UInt16>(), ()])
            @Expect("assertion#3564: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_113")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<UInt16>()],
                    [123u64, GenericClassWith1TypeParameters<UInt16>(), ()])
            @Expect("assertion#3565: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_113")[0i64]
                .apply(StandardStructType<UInt64, UInt64, Int8>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [123u64, GenericClassWith1TypeParameters<UInt16>(), NonGenericClass()])
            @Expect("assertion#3566: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_113")[0i64]
                .apply(StandardStructType<UInt64, UInt64, Int8>(), [TypeInfo.of<UInt8>(), TypeInfo.of<UInt16>()],
                    [GenericClassWith1TypeParameters<UInt16>(), NonGenericClass()])
            @Expect("assertion#3567: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_113")[0i64]
                .apply(StandardStructType<UInt64, UInt64, Int8>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Bool>()],
                    [123u64, GenericClassWith1TypeParameters<UInt16>()])
            @Expect("assertion#3568: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_113")[0i64]
                .apply(StandardStructType<UInt64, UInt64, Int8>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Bool>()],
                    [123u64, GenericClassWith1TypeParameters<UInt16>(), NonGenericClass(), 114.514000f64])
            @Expect("assertion#3569: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_113")[0i64]
                .apply(StandardStructType<UInt64, UInt64, Int8>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [114.514000f64, GenericClassWith1TypeParameters<UInt16>(), NonGenericClass()])
            @Expect("assertion#3570: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_113")[0i64]
                .apply(StandardStructType<UInt64, UInt64, Int8>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [123u64, (), NonGenericClass()])
            @Expect("assertion#3571: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_113")[0i64]
                .apply(StandardStructType<UInt64, UInt64, Int8>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [123u64, GenericClassWith1TypeParameters<UInt16>(), ()])
            @Expect("assertion#3572: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_113")[0i64]
                .apply(StandardStructType<UInt64, UInt64, Int8>(),
                    [123u64, GenericClassWith1TypeParameters<UInt16>(), NonGenericClass()])
            @Expect("assertion#3573: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_113")[0i64]
                .apply(1i64, [123u64, GenericClassWith1TypeParameters<UInt16>(), NonGenericClass()])
            @Expect("assertion#3574: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_113")[0i64]
                .apply("hello", [123u64, GenericClassWith1TypeParameters<UInt16>(), NonGenericClass()])
            @Expect("assertion#3575: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_113")[0i64]
                .apply(StandardStructType<UInt64, UInt64, Int8>(),
                    [GenericClassWith1TypeParameters<UInt16>(), NonGenericClass()])
            @Expect("assertion#3576: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_113")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<UInt16>(), NonGenericClass()])
            @Expect("assertion#3577: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_113")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<UInt16>(), NonGenericClass()])
            @Expect("assertion#3578: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_113")[0i64]
                .apply(StandardStructType<UInt64, UInt64, Int8>(), [123u64, GenericClassWith1TypeParameters<UInt16>()])
            @Expect("assertion#3579: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_113")[0i64]
                .apply(1i64, [123u64, GenericClassWith1TypeParameters<UInt16>()])
            @Expect("assertion#3580: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_113")[0i64]
                .apply("hello", [123u64, GenericClassWith1TypeParameters<UInt16>()])
            @Expect("assertion#3581: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_113")[0i64]
                .apply(StandardStructType<UInt64, UInt64, Int8>(),
                    [123u64, GenericClassWith1TypeParameters<UInt16>(), NonGenericClass(), 114.514000f64])
            @Expect("assertion#3582: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_113")[0i64]
                .apply(1i64, [123u64, GenericClassWith1TypeParameters<UInt16>(), NonGenericClass(), 114.514000f64])
            @Expect("assertion#3583: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_113")[0i64]
                .apply("hello", [123u64, GenericClassWith1TypeParameters<UInt16>(), NonGenericClass(), 114.514000f64])
            @Expect("assertion#3584: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_113")[0i64]
                .apply(StandardStructType<UInt64, UInt64, Int8>(),
                    [114.514000f64, GenericClassWith1TypeParameters<UInt16>(), NonGenericClass()])
            @Expect("assertion#3585: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_113")[0i64]
                .apply(1i64, [114.514000f64, GenericClassWith1TypeParameters<UInt16>(), NonGenericClass()])
            @Expect("assertion#3586: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_113")[0i64]
                .apply("hello", [114.514000f64, GenericClassWith1TypeParameters<UInt16>(), NonGenericClass()])
            @Expect("assertion#3587: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_113")[0i64]
                .apply(StandardStructType<UInt64, UInt64, Int8>(), [123u64, (), NonGenericClass()])
            @Expect("assertion#3588: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_113")[0i64]
                .apply(1i64, [123u64, (), NonGenericClass()])
            @Expect("assertion#3589: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_113")[0i64]
                .apply("hello", [123u64, (), NonGenericClass()])
            @Expect("assertion#3590: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_113")[0i64]
                .apply(StandardStructType<UInt64, UInt64, Int8>(), [123u64, GenericClassWith1TypeParameters<UInt16>(),
                    ()])
            @Expect("assertion#3591: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_113")[0i64]
                .apply(1i64, [123u64, GenericClassWith1TypeParameters<UInt16>(), ()])
            @Expect("assertion#3592: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_113")[0i64]
                .apply("hello", [123u64, GenericClassWith1TypeParameters<UInt16>(), ()])
            @Expect("assertion#3593: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_112 ends.")
    }
}
