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
class testGetInstanceFunctions_StandardClassType_18 {
    @TestCase
    func TestCase_88(): Unit {
        // logger.info("testcase TestCase_88 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int8, Unit, Int64>>().getInstanceFunctions("classInstanceMemberFunction_89").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int8, Unit, Int64>>()
            .getInstanceFunctions("classInstanceMemberFunction_89")[0i64]
            .apply(StandardClassType<Int8, Unit, Int64>(),
                [TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Bool>()], [NonGenericStruct()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_89")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<Bool>()], [NonGenericStruct()])
            @Expect("assertion#2763: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_89")[0i64]
                .apply("hello", [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [NonGenericStruct()])
            @Expect("assertion#2764: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_89")[0i64]
                .apply(1i64, [TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#2765: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_89")[0i64]
                .apply(StandardClassType<Int8, Unit, Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#2766: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_89")[0i64]
                .apply("hello", [TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#2767: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_89")[0i64]
                .apply("hello", [TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#2768: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_89")[0i64]
                .apply(StandardClassType<Int8, Unit, Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#2769: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_89")[0i64]
                .apply(1i64, [TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#2770: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_89")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<Bool>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2771: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_89")[0i64]
                .apply(1i64, [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2772: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_89")[0i64]
                .apply(StandardClassType<Int8, Unit, Int64>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2773: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_89")[0i64]
                .apply(StandardClassType<Int8, Unit, Int64>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#2774: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_89")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#2775: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_89")[0i64]
                .apply("hello", [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#2776: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_89")[0i64]
                .apply(StandardClassType<Int8, Unit, Int64>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct()])
            @Expect("assertion#2777: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_89")[0i64]
                .apply(StandardClassType<Int8, Unit, Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#2778: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_89")[0i64]
                .apply(StandardClassType<Int8, Unit, Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#2779: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_89")[0i64]
                .apply(StandardClassType<Int8, Unit, Int64>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Bool>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2780: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_89")[0i64]
                .apply(StandardClassType<Int8, Unit, Int64>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#2781: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_89")[0i64]
                .apply(StandardClassType<Int8, Unit, Int64>(), [NonGenericStruct()])
            @Expect("assertion#2782: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_89")[0i64]
                .apply(1i64, [NonGenericStruct()])
            @Expect("assertion#2783: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_89")[0i64]
                .apply("hello", [NonGenericStruct()])
            @Expect("assertion#2784: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_89")[0i64]
                .apply(StandardClassType<Int8, Unit, Int64>(), [])
            @Expect("assertion#2785: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_89")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2786: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_89")[0i64]
                .apply("hello", [])
            @Expect("assertion#2787: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_89")[0i64]
                .apply(StandardClassType<Int8, Unit, Int64>(), [])
            @Expect("assertion#2788: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_89")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2789: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_89")[0i64]
                .apply("hello", [])
            @Expect("assertion#2790: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_89")[0i64]
                .apply(StandardClassType<Int8, Unit, Int64>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2791: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_89")[0i64]
                .apply(1i64, [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2792: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_89")[0i64]
                .apply("hello", [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2793: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_89")[0i64]
                .apply(StandardClassType<Int8, Unit, Int64>(), [()])
            @Expect("assertion#2794: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_89")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#2795: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_89")[0i64]
                .apply("hello", [()])
            @Expect("assertion#2796: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_88 ends.")
    }
}
