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
class testGetInstanceFunctions_StandardStructType_20 {
    @TestCase
    func TestCase_207(): Unit {
        // logger.info("testcase TestCase_207 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Bool, UInt32, Int16>>().getInstanceFunctions("classInstanceMemberFunction_208").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Bool, UInt32, Int16>>()
            .getInstanceFunctions("classInstanceMemberFunction_208")[0i64]
            .apply(StandardStructType<Bool, UInt32, Int16>(),
                [TypeInfo.of<Float32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()],
                [GenericStructWith1TypeParameters<Int16>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_208")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [GenericStructWith1TypeParameters<Int16>()])
            @Expect("assertion#6580: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_208")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<Int16>()],
                    [GenericStructWith1TypeParameters<Int16>()])
            @Expect("assertion#6581: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_208")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#6582: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_208")[0i64]
                .apply(StandardStructType<Bool, UInt32, Int16>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#6583: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_208")[0i64]
                .apply("hello",
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#6584: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_208")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#6585: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_208")[0i64]
                .apply(StandardStructType<Bool, UInt32, Int16>(), [TypeInfo.of<Float32>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#6586: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_208")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#6587: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_208")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#6588: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_208")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<Int16>()],
                    [GenericStructWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#6589: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_208")[0i64]
                .apply(StandardStructType<Bool, UInt32, Int16>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#6590: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_208")[0i64]
                .apply(StandardStructType<Bool, UInt32, Int16>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#6591: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_208")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#6592: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_208")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#6593: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_208")[0i64]
                .apply(StandardStructType<Bool, UInt32, Int16>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Int16>()])
            @Expect("assertion#6594: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_208")[0i64]
                .apply(StandardStructType<Bool, UInt32, Int16>(), [TypeInfo.of<Float32>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#6595: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_208")[0i64]
                .apply(StandardStructType<Bool, UInt32, Int16>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#6596: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_208")[0i64]
                .apply(StandardStructType<Bool, UInt32, Int16>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#6597: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_208")[0i64]
                .apply(StandardStructType<Bool, UInt32, Int16>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#6598: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_208")[0i64]
                .apply(StandardStructType<Bool, UInt32, Int16>(), [GenericStructWith1TypeParameters<Int16>()])
            @Expect("assertion#6599: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_208")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Int16>()])
            @Expect("assertion#6600: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_208")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Int16>()])
            @Expect("assertion#6601: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_208")[0i64]
                .apply(StandardStructType<Bool, UInt32, Int16>(), [])
            @Expect("assertion#6602: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_208")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6603: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_208")[0i64]
                .apply("hello", [])
            @Expect("assertion#6604: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_208")[0i64]
                .apply(StandardStructType<Bool, UInt32, Int16>(), [])
            @Expect("assertion#6605: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_208")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6606: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_208")[0i64]
                .apply("hello", [])
            @Expect("assertion#6607: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_208")[0i64]
                .apply(StandardStructType<Bool, UInt32, Int16>(),
                    [GenericStructWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#6608: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_208")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#6609: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_208")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#6610: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_208")[0i64]
                .apply(StandardStructType<Bool, UInt32, Int16>(), [()])
            @Expect("assertion#6611: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_208")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#6612: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_208")[0i64]
                .apply("hello", [()])
            @Expect("assertion#6613: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_207 ends.")
    }
}
