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
class testGetInstanceFunctions_StandardClassType_20 {
    @TestCase
    func TestCase_98(): Unit {
        // logger.info("testcase TestCase_98 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Unit, Bool, Unit>>().getInstanceFunctions("classInstanceMemberFunction_99").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Unit, Bool, Unit>>()
            .getInstanceFunctions("classInstanceMemberFunction_99")[0i64]
            .apply(StandardClassType<Unit, Bool, Unit>(),
                [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt8>()],
                [GenericStructWith1TypeParameters<Int64>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_99")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>()], [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#3103: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_99")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>()],
                    [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#3104: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_99")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#3105: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_99")[0i64]
                .apply(StandardClassType<Unit, Bool, Unit>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#3106: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_99")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt8>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#3107: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_99")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#3108: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_99")[0i64]
                .apply(StandardClassType<Unit, Bool, Unit>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#3109: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_99")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#3110: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_99")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>()],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#3111: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_99")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>()],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#3112: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_99")[0i64]
                .apply(StandardClassType<Unit, Bool, Unit>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#3113: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_99")[0i64]
                .apply(StandardClassType<Unit, Bool, Unit>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#3114: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_99")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#3115: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_99")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#3116: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_99")[0i64]
                .apply(StandardClassType<Unit, Bool, Unit>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#3117: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_99")[0i64]
                .apply(StandardClassType<Unit, Bool, Unit>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#3118: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_99")[0i64]
                .apply(StandardClassType<Unit, Bool, Unit>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#3119: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_99")[0i64]
                .apply(StandardClassType<Unit, Bool, Unit>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt8>()],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#3120: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_99")[0i64]
                .apply(StandardClassType<Unit, Bool, Unit>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#3121: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_99")[0i64]
                .apply(StandardClassType<Unit, Bool, Unit>(), [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#3122: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_99")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#3123: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_99")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#3124: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_99")[0i64]
                .apply(StandardClassType<Unit, Bool, Unit>(), [])
            @Expect("assertion#3125: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_99")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3126: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_99")[0i64]
                .apply("hello", [])
            @Expect("assertion#3127: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_99")[0i64]
                .apply(StandardClassType<Unit, Bool, Unit>(), [])
            @Expect("assertion#3128: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_99")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3129: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_99")[0i64]
                .apply("hello", [])
            @Expect("assertion#3130: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_99")[0i64]
                .apply(StandardClassType<Unit, Bool, Unit>(), [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#3131: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_99")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#3132: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_99")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#3133: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_99")[0i64]
                .apply(StandardClassType<Unit, Bool, Unit>(), [()])
            @Expect("assertion#3134: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_99")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#3135: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_99")[0i64]
                .apply("hello", [()])
            @Expect("assertion#3136: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_98 ends.")
    }
}
