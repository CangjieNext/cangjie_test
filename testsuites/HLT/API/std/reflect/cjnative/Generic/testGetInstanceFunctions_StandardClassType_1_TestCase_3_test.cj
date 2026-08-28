/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0 
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
class testGetInstanceFunctions_StandardClassType_1 {
    @TestCase
    func TestCase_3(): Unit {
        // logger.info("testcase TestCase_3 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int16, Bool, Float64>>().getInstanceFunctions("classInstanceMemberFunction_4").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int16, Bool, Float64>>()
            .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
            .apply(StandardClassType<Int16, Bool, Float64>(),
                [TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int8>()],
                [NonGenericClass(), 1u8, GenericStructWith1TypeParameters<Bool>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Int8>()],
                    [NonGenericClass(), 1u8, GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#69: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()],
                    [NonGenericClass(), 1u8, GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#70: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int8>()],
                    [1u8, GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#71: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply(StandardClassType<Int16, Bool, Float64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Int8>()],
                    [1u8, GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#72: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int8>(),
                    TypeInfo.of<Float64>()], [1u8, GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#73: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int8>()],
                    [NonGenericClass(), 1u8])
            @Expect("assertion#74: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply(StandardClassType<Int16, Bool, Float64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()],
                    [NonGenericClass(), 1u8])
            @Expect("assertion#75: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 1u8])
            @Expect("assertion#76: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<Int8>()],
                    [NonGenericClass(), 1u8, GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#77: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()],
                    [NonGenericClass(), 1u8, GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#78: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply(StandardClassType<Int16, Bool, Float64>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 1u8, GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#79: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply(StandardClassType<Int16, Bool, Float64>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int8>()],
                    [(), 1u8, GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#80: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Int8>()],
                    [(), 1u8, GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#81: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()],
                    [(), 1u8, GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#82: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply(StandardClassType<Int16, Bool, Float64>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int8>()],
                    [NonGenericClass(), 114.514000f64, GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#83: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Int8>()],
                    [NonGenericClass(), 114.514000f64, GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#84: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()],
                    [NonGenericClass(), 114.514000f64, GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#85: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply(StandardClassType<Int16, Bool, Float64>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int8>()], [NonGenericClass(), 1u8, ()])
            @Expect("assertion#86: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Int8>()], [NonGenericClass(), 1u8, ()])
            @Expect("assertion#87: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()], [NonGenericClass(), 1u8, ()])
            @Expect("assertion#88: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply(StandardClassType<Int16, Bool, Float64>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 1u8, GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#89: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply(StandardClassType<Int16, Bool, Float64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()],
                    [1u8, GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#90: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply(StandardClassType<Int16, Bool, Float64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Int8>()],
                    [NonGenericClass(), 1u8])
            @Expect("assertion#91: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply(StandardClassType<Int16, Bool, Float64>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int8>()],
                    [NonGenericClass(), 1u8, GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#92: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply(StandardClassType<Int16, Bool, Float64>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [(), 1u8, GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#93: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply(StandardClassType<Int16, Bool, Float64>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64, GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#94: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply(StandardClassType<Int16, Bool, Float64>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 1u8, ()])
            @Expect("assertion#95: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply(StandardClassType<Int16, Bool, Float64>(),
                    [NonGenericClass(), 1u8, GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#96: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply(1i64, [NonGenericClass(), 1u8, GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#97: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply("hello", [NonGenericClass(), 1u8, GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#98: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply(StandardClassType<Int16, Bool, Float64>(), [1u8, GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#99: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply(1i64, [1u8, GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#100: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply("hello", [1u8, GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#101: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply(StandardClassType<Int16, Bool, Float64>(), [NonGenericClass(), 1u8])
            @Expect("assertion#102: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply(1i64, [NonGenericClass(), 1u8])
            @Expect("assertion#103: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply("hello", [NonGenericClass(), 1u8])
            @Expect("assertion#104: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply(StandardClassType<Int16, Bool, Float64>(),
                    [NonGenericClass(), 1u8, GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#105: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply(1i64, [NonGenericClass(), 1u8, GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#106: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply("hello", [NonGenericClass(), 1u8, GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#107: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply(StandardClassType<Int16, Bool, Float64>(), [(), 1u8, GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#108: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply(1i64, [(), 1u8, GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#109: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply("hello", [(), 1u8, GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#110: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply(StandardClassType<Int16, Bool, Float64>(),
                    [NonGenericClass(), 114.514000f64, GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#111: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply(1i64, [NonGenericClass(), 114.514000f64, GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#112: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply("hello", [NonGenericClass(), 114.514000f64, GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#113: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply(StandardClassType<Int16, Bool, Float64>(), [NonGenericClass(), 1u8, ()])
            @Expect("assertion#114: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply(1i64, [NonGenericClass(), 1u8, ()])
            @Expect("assertion#115: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply("hello", [NonGenericClass(), 1u8, ()])
            @Expect("assertion#116: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_3 ends.")
    }
}
