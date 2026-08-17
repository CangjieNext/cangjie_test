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
class testGetInstanceFunctions_StandardClassType_19 {
    @TestCase
    func TestCase_93(): Unit {
        // logger.info("testcase TestCase_93 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int8, UInt32, Int8>>().getInstanceFunctions("classInstanceMemberFunction_94").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int8, UInt32, Int8>>()
            .getInstanceFunctions("classInstanceMemberFunction_94")[0i64]
            .apply(StandardClassType<Int8, UInt32, Int8>(),
                [TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<Int8>()],
                [GenericStructWith1TypeParameters<Unit>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_94")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<Int8>()], [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#2933: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_94")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Bool>()], [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#2934: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_94")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#2935: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_94")[0i64]
                .apply(StandardClassType<Int8, UInt32, Int8>(), [TypeInfo.of<Bool>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#2936: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_94")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#2937: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_94")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#2938: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_94")[0i64]
                .apply(StandardClassType<Int8, UInt32, Int8>(), [TypeInfo.of<Int64>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#2939: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_94")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#2940: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_94")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<Int8>()],
                    [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#2941: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_94")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Bool>()],
                    [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#2942: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_94")[0i64]
                .apply(StandardClassType<Int8, UInt32, Int8>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#2943: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_94")[0i64]
                .apply(StandardClassType<Int8, UInt32, Int8>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#2944: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_94")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#2945: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_94")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#2946: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_94")[0i64]
                .apply(StandardClassType<Int8, UInt32, Int8>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#2947: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_94")[0i64]
                .apply(StandardClassType<Int8, UInt32, Int8>(), [TypeInfo.of<Int64>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#2948: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_94")[0i64]
                .apply(StandardClassType<Int8, UInt32, Int8>(), [TypeInfo.of<Bool>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#2949: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_94")[0i64]
                .apply(StandardClassType<Int8, UInt32, Int8>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<Int8>()],
                    [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#2950: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_94")[0i64]
                .apply(StandardClassType<Int8, UInt32, Int8>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#2951: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_94")[0i64]
                .apply(StandardClassType<Int8, UInt32, Int8>(), [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#2952: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_94")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#2953: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_94")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#2954: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_94")[0i64]
                .apply(StandardClassType<Int8, UInt32, Int8>(), [])
            @Expect("assertion#2955: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_94")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2956: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_94")[0i64]
                .apply("hello", [])
            @Expect("assertion#2957: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_94")[0i64]
                .apply(StandardClassType<Int8, UInt32, Int8>(), [])
            @Expect("assertion#2958: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_94")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2959: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_94")[0i64]
                .apply("hello", [])
            @Expect("assertion#2960: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_94")[0i64]
                .apply(StandardClassType<Int8, UInt32, Int8>(), [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#2961: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_94")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#2962: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_94")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#2963: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_94")[0i64]
                .apply(StandardClassType<Int8, UInt32, Int8>(), [()])
            @Expect("assertion#2964: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_94")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#2965: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_94")[0i64]
                .apply("hello", [()])
            @Expect("assertion#2966: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_93 ends.")
    }
}
