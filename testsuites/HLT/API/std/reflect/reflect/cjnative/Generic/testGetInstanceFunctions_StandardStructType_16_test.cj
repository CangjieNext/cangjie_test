/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1 
// DEPENDENCE: dependency
// (not MAC) EXEC: cd dependency && %compiler %cmp_opt --output-type=dylib  *.cj -o libdependency.%test_suffix
// (not MAC) EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output --import-path . -L dependency -ldependency
// (not MAC) RUN-EXEC: %cp ./dependency/libdependency.%test_suffix .&& %run %run_opt %output %run_utest_opt %run_args  
package testsuite

import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*
import std.reflect.*
import dependency.*

@Test
class testGetInstanceFunctions_StandardStructType_16 {
    @TestCase
    func TestCase_184(): Unit {
        // logger.info("testcase TestCase_184 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt8, Int8, Int8>>().getInstanceFunctions("classInstanceMemberFunction_185").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt8, Int8, Int8>>()
            .getInstanceFunctions("classInstanceMemberFunction_185")[0i64]
            .apply(StandardStructType<UInt8, Int8, Int8>(),
                [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>()],
                [GenericClassWith2TypeParameters<Unit, Unit>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_185")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#5798: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_185")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#5799: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_185")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#5800: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_185")[0i64]
                .apply(StandardStructType<UInt8, Int8, Int8>(), [TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#5801: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_185")[0i64]
                .apply("hello",
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#5802: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_185")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#5803: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_185")[0i64]
                .apply(StandardStructType<UInt8, Int8, Int8>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#5804: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_185")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#5805: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_185")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#5806: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_185")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#5807: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_185")[0i64]
                .apply(StandardStructType<UInt8, Int8, Int8>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#5808: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_185")[0i64]
                .apply(StandardStructType<UInt8, Int8, Int8>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#5809: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_185")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#5810: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_185")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#5811: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_185")[0i64]
                .apply(StandardStructType<UInt8, Int8, Int8>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#5812: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_185")[0i64]
                .apply(StandardStructType<UInt8, Int8, Int8>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#5813: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_185")[0i64]
                .apply(StandardStructType<UInt8, Int8, Int8>(), [TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#5814: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_185")[0i64]
                .apply(StandardStructType<UInt8, Int8, Int8>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#5815: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_185")[0i64]
                .apply(StandardStructType<UInt8, Int8, Int8>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#5816: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_185")[0i64]
                .apply(StandardStructType<UInt8, Int8, Int8>(), [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#5817: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_185")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#5818: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_185")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#5819: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_185")[0i64]
                .apply(StandardStructType<UInt8, Int8, Int8>(), [])
            @Expect("assertion#5820: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_185")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5821: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_185")[0i64]
                .apply("hello", [])
            @Expect("assertion#5822: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_185")[0i64]
                .apply(StandardStructType<UInt8, Int8, Int8>(), [])
            @Expect("assertion#5823: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_185")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5824: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_185")[0i64]
                .apply("hello", [])
            @Expect("assertion#5825: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_185")[0i64]
                .apply(StandardStructType<UInt8, Int8, Int8>(),
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#5826: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_185")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#5827: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_185")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#5828: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_185")[0i64]
                .apply(StandardStructType<UInt8, Int8, Int8>(), [()])
            @Expect("assertion#5829: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_185")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#5830: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_185")[0i64]
                .apply("hello", [()])
            @Expect("assertion#5831: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_184 ends.")
    }

    @TestCase
    func TestCase_185(): Unit {
        // logger.info("testcase TestCase_185 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Bool, Int32, Int16>>().getInstanceFunctions("classInstanceMemberFunction_186").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Bool, Int32, Int16>>()
            .getInstanceFunctions("classInstanceMemberFunction_186")[0i64]
            .apply(StandardStructType<Bool, Int32, Int16>(),
                [TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<Bool>()],
                [GenericClassWith2TypeParameters<Bool, Bool>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_186")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<Bool>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#5832: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_186")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Int32>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#5833: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_186")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#5834: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_186")[0i64]
                .apply(StandardStructType<Bool, Int32, Int16>(), [TypeInfo.of<Int32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#5835: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_186")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#5836: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_186")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#5837: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_186")[0i64]
                .apply(StandardStructType<Bool, Int32, Int16>(), [TypeInfo.of<Int64>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#5838: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_186")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#5839: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_186")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<Bool>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#5840: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_186")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Int32>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#5841: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_186")[0i64]
                .apply(StandardStructType<Bool, Int32, Int16>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#5842: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_186")[0i64]
                .apply(StandardStructType<Bool, Int32, Int16>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#5843: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_186")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#5844: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_186")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#5845: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_186")[0i64]
                .apply(StandardStructType<Bool, Int32, Int16>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#5846: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_186")[0i64]
                .apply(StandardStructType<Bool, Int32, Int16>(), [TypeInfo.of<Int64>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#5847: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_186")[0i64]
                .apply(StandardStructType<Bool, Int32, Int16>(), [TypeInfo.of<Int32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#5848: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_186")[0i64]
                .apply(StandardStructType<Bool, Int32, Int16>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<Bool>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#5849: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_186")[0i64]
                .apply(StandardStructType<Bool, Int32, Int16>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#5850: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_186")[0i64]
                .apply(StandardStructType<Bool, Int32, Int16>(), [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#5851: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_186")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#5852: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_186")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#5853: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_186")[0i64]
                .apply(StandardStructType<Bool, Int32, Int16>(), [])
            @Expect("assertion#5854: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_186")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5855: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_186")[0i64]
                .apply("hello", [])
            @Expect("assertion#5856: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_186")[0i64]
                .apply(StandardStructType<Bool, Int32, Int16>(), [])
            @Expect("assertion#5857: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_186")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5858: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_186")[0i64]
                .apply("hello", [])
            @Expect("assertion#5859: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_186")[0i64]
                .apply(StandardStructType<Bool, Int32, Int16>(),
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#5860: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_186")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#5861: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_186")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#5862: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_186")[0i64]
                .apply(StandardStructType<Bool, Int32, Int16>(), [()])
            @Expect("assertion#5863: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_186")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#5864: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_186")[0i64]
                .apply("hello", [()])
            @Expect("assertion#5865: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_185 ends.")
    }

    @TestCase
    func TestCase_186(): Unit {
        // logger.info("testcase TestCase_186 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int16, Int64, UInt8>>().getInstanceFunctions("classInstanceMemberFunction_187").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int16, Int64, UInt8>>()
            .getInstanceFunctions("classInstanceMemberFunction_187")[0i64]
            .apply(StandardStructType<Int16, Int64, UInt8>(),
                [TypeInfo.of<UInt64>(), TypeInfo.of<Bool>(), TypeInfo.of<Unit>()],
                [GenericClassWith2TypeParameters<Int64, Int64>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_187")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<Unit>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#5866: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_187")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<Bool>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#5867: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_187")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<Bool>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#5868: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_187")[0i64]
                .apply(StandardStructType<Int16, Int64, UInt8>(), [TypeInfo.of<Bool>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#5869: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_187")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#5870: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_187")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<Bool>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#5871: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_187")[0i64]
                .apply(StandardStructType<Int16, Int64, UInt8>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#5872: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_187")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#5873: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_187")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<Unit>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#5874: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_187")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<Bool>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#5875: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_187")[0i64]
                .apply(StandardStructType<Int16, Int64, UInt8>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#5876: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_187")[0i64]
                .apply(StandardStructType<Int16, Int64, UInt8>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Bool>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#5877: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_187")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#5878: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_187")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#5879: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_187")[0i64]
                .apply(StandardStructType<Int16, Int64, UInt8>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#5880: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_187")[0i64]
                .apply(StandardStructType<Int16, Int64, UInt8>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#5881: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_187")[0i64]
                .apply(StandardStructType<Int16, Int64, UInt8>(), [TypeInfo.of<Bool>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#5882: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_187")[0i64]
                .apply(StandardStructType<Int16, Int64, UInt8>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Bool>(), TypeInfo.of<Unit>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#5883: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_187")[0i64]
                .apply(StandardStructType<Int16, Int64, UInt8>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#5884: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_187")[0i64]
                .apply(StandardStructType<Int16, Int64, UInt8>(), [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#5885: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_187")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#5886: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_187")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#5887: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_187")[0i64]
                .apply(StandardStructType<Int16, Int64, UInt8>(), [])
            @Expect("assertion#5888: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_187")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5889: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_187")[0i64]
                .apply("hello", [])
            @Expect("assertion#5890: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_187")[0i64]
                .apply(StandardStructType<Int16, Int64, UInt8>(), [])
            @Expect("assertion#5891: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_187")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5892: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_187")[0i64]
                .apply("hello", [])
            @Expect("assertion#5893: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_187")[0i64]
                .apply(StandardStructType<Int16, Int64, UInt8>(),
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#5894: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_187")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#5895: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_187")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#5896: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_187")[0i64]
                .apply(StandardStructType<Int16, Int64, UInt8>(), [()])
            @Expect("assertion#5897: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_187")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#5898: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_187")[0i64]
                .apply("hello", [()])
            @Expect("assertion#5899: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_186 ends.")
    }

    @TestCase
    func TestCase_187(): Unit {
        // logger.info("testcase TestCase_187 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int16, Int8, Int8>>().getInstanceFunctions("classInstanceMemberFunction_188").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int16, Int8, Int8>>()
            .getInstanceFunctions("classInstanceMemberFunction_188")[0i64]
            .apply(StandardStructType<Int16, Int8, Int8>(),
                [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int32>()],
                [GenericClassWith2TypeParameters<Int8, Int8>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_188")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<Int32>()],
                    [GenericClassWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#5900: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_188")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()],
                    [GenericClassWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#5901: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_188")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#5902: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_188")[0i64]
                .apply(StandardStructType<Int16, Int8, Int8>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#5903: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_188")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int32>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#5904: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_188")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#5905: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_188")[0i64]
                .apply(StandardStructType<Int16, Int8, Int8>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#5906: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_188")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#5907: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_188")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<Int32>()],
                    [GenericClassWith2TypeParameters<Int8, Int8>(), 114.514000f64])
            @Expect("assertion#5908: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_188")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()],
                    [GenericClassWith2TypeParameters<Int8, Int8>(), 114.514000f64])
            @Expect("assertion#5909: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_188")[0i64]
                .apply(StandardStructType<Int16, Int8, Int8>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Int8, Int8>(), 114.514000f64])
            @Expect("assertion#5910: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_188")[0i64]
                .apply(StandardStructType<Int16, Int8, Int8>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#5911: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_188")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#5912: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_188")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#5913: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_188")[0i64]
                .apply(StandardStructType<Int16, Int8, Int8>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#5914: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_188")[0i64]
                .apply(StandardStructType<Int16, Int8, Int8>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#5915: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_188")[0i64]
                .apply(StandardStructType<Int16, Int8, Int8>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#5916: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_188")[0i64]
                .apply(StandardStructType<Int16, Int8, Int8>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int32>()],
                    [GenericClassWith2TypeParameters<Int8, Int8>(), 114.514000f64])
            @Expect("assertion#5917: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_188")[0i64]
                .apply(StandardStructType<Int16, Int8, Int8>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#5918: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_188")[0i64]
                .apply(StandardStructType<Int16, Int8, Int8>(), [GenericClassWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#5919: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_188")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#5920: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_188")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#5921: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_188")[0i64]
                .apply(StandardStructType<Int16, Int8, Int8>(), [])
            @Expect("assertion#5922: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_188")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5923: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_188")[0i64]
                .apply("hello", [])
            @Expect("assertion#5924: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_188")[0i64]
                .apply(StandardStructType<Int16, Int8, Int8>(), [])
            @Expect("assertion#5925: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_188")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5926: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_188")[0i64]
                .apply("hello", [])
            @Expect("assertion#5927: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_188")[0i64]
                .apply(StandardStructType<Int16, Int8, Int8>(),
                    [GenericClassWith2TypeParameters<Int8, Int8>(), 114.514000f64])
            @Expect("assertion#5928: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_188")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Int8, Int8>(), 114.514000f64])
            @Expect("assertion#5929: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_188")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Int8, Int8>(), 114.514000f64])
            @Expect("assertion#5930: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_188")[0i64]
                .apply(StandardStructType<Int16, Int8, Int8>(), [()])
            @Expect("assertion#5931: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_188")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#5932: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_188")[0i64]
                .apply("hello", [()])
            @Expect("assertion#5933: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_187 ends.")
    }

    @TestCase
    func TestCase_188(): Unit {
        // logger.info("testcase TestCase_188 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt64, UInt64, UInt8>>().getInstanceFunctions("classInstanceMemberFunction_189").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt64, UInt64, UInt8>>()
            .getInstanceFunctions("classInstanceMemberFunction_189")[0i64]
            .apply(StandardStructType<UInt64, UInt64, UInt8>(),
                [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(), TypeInfo.of<Bool>()],
                [GenericClassWith2TypeParameters<Unit, Unit>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_189")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<Bool>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#5934: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_189")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#5935: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_189")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#5936: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_189")[0i64]
                .apply(StandardStructType<UInt64, UInt64, UInt8>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#5937: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_189")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#5938: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_189")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#5939: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_189")[0i64]
                .apply(StandardStructType<UInt64, UInt64, UInt8>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#5940: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_189")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#5941: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_189")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<Bool>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#5942: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_189")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#5943: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_189")[0i64]
                .apply(StandardStructType<UInt64, UInt64, UInt8>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#5944: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_189")[0i64]
                .apply(StandardStructType<UInt64, UInt64, UInt8>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#5945: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_189")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#5946: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_189")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#5947: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_189")[0i64]
                .apply(StandardStructType<UInt64, UInt64, UInt8>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#5948: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_189")[0i64]
                .apply(StandardStructType<UInt64, UInt64, UInt8>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#5949: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_189")[0i64]
                .apply(StandardStructType<UInt64, UInt64, UInt8>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#5950: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_189")[0i64]
                .apply(StandardStructType<UInt64, UInt64, UInt8>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(), TypeInfo.of<Bool>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#5951: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_189")[0i64]
                .apply(StandardStructType<UInt64, UInt64, UInt8>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#5952: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_189")[0i64]
                .apply(StandardStructType<UInt64, UInt64, UInt8>(), [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#5953: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_189")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#5954: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_189")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#5955: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_189")[0i64]
                .apply(StandardStructType<UInt64, UInt64, UInt8>(), [])
            @Expect("assertion#5956: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_189")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5957: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_189")[0i64]
                .apply("hello", [])
            @Expect("assertion#5958: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_189")[0i64]
                .apply(StandardStructType<UInt64, UInt64, UInt8>(), [])
            @Expect("assertion#5959: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_189")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5960: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_189")[0i64]
                .apply("hello", [])
            @Expect("assertion#5961: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_189")[0i64]
                .apply(StandardStructType<UInt64, UInt64, UInt8>(),
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#5962: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_189")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#5963: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_189")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#5964: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_189")[0i64]
                .apply(StandardStructType<UInt64, UInt64, UInt8>(), [()])
            @Expect("assertion#5965: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_189")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#5966: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_189")[0i64]
                .apply("hello", [()])
            @Expect("assertion#5967: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_188 ends.")
    }
}
