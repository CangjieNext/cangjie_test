/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0 
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
class testGetInstanceFunctions_StandardClassType_1 {
    @TestCase
    func TestCase_0(): Unit {
        // logger.info("testcase TestCase_0 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int64, Float32, UInt8>>().getInstanceFunctions("classInstanceMemberFunction_1").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_1")[0i64]
                .apply(StandardClassType<Int64, Float32, UInt8>(), [], [])
            @Expect("assertion#0: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_1")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [])
            @Expect("assertion#1: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_1")[0i64]
                .apply(1i64, [], [114.514000f64])
            @Expect("assertion#2: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_1")[0i64]
                .apply(StandardClassType<Int64, Float32, UInt8>(), [TypeInfo.of<Float32>()], [114.514000f64])
            @Expect("assertion#3: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_1")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_1")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [114.514000f64])
            @Expect("assertion#5: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int64, Float32, UInt8>>()
            .getInstanceFunctions("classInstanceMemberFunction_1")[0i64]
            .apply(StandardClassType<Int64, Float32, UInt8>(), [])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_1")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Int64, Float32, UInt8>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_1")[0i64]
                .apply("hello", [])
            @Expect("assertion#7: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Int64, Float32, UInt8>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_1")[0i64]
                .apply(StandardClassType<Int64, Float32, UInt8>(), [114.514000f64])
            @Expect("assertion#8: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_1")[0i64]
                .apply(1i64, [114.514000f64])
            @Expect("assertion#9: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_1")[0i64]
                .apply("hello", [114.514000f64])
            @Expect("assertion#10: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("testcase TestCase_0 ends.")
    }

    @TestCase
    func TestCase_1(): Unit {
        // logger.info("testcase TestCase_1 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt16, Int8, UInt64>>().getInstanceFunctions("classInstanceMemberFunction_2").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt16, Int8, UInt64>>()
            .getInstanceFunctions("classInstanceMemberFunction_2")[0i64]
            .apply(StandardClassType<UInt16, Int8, UInt64>(),
                [TypeInfo.of<UInt16>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt8>()], [])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_2")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#11: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_2")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#12: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_2")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt8>()], [114.514000f64])
            @Expect("assertion#13: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_2")[0i64]
                .apply(StandardClassType<UInt16, Int8, UInt64>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>()],
                    [114.514000f64])
            @Expect("assertion#14: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_2")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt8>(),
                    TypeInfo.of<Float64>()], [114.514000f64])
            @Expect("assertion#15: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_2")[0i64]
                .apply(StandardClassType<UInt16, Int8, UInt64>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_2")[0i64]
                .apply(StandardClassType<UInt16, Int8, UInt64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Int64>()],
                    [114.514000f64])
            @Expect("assertion#17: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_2")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#18: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<UInt16, Int8, UInt64>\", but now it`s \"String\"")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_2")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#19: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_2")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#20: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_2")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#21: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_2")[0i64]
                .apply(StandardClassType<UInt16, Int8, UInt64>(), [])
            @Expect("assertion#22: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_2")[0i64]
                .apply(1i64, [])
            @Expect("assertion#23: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_2")[0i64]
                .apply("hello", [])
            @Expect("assertion#24: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_2")[0i64]
                .apply(StandardClassType<UInt16, Int8, UInt64>(), [114.514000f64])
            @Expect("assertion#25: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_2")[0i64]
                .apply(1i64, [114.514000f64])
            @Expect("assertion#26: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_2")[0i64]
                .apply("hello", [114.514000f64])
            @Expect("assertion#27: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_1 ends.")
    }

    @TestCase
    func TestCase_2(): Unit {
        // logger.info("testcase TestCase_2 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt16, Unit, UInt32>>().getInstanceFunctions("classInstanceMemberFunction_3").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply(StandardClassType<UInt16, Unit, UInt32>(), [],
                    [GenericClassWith2TypeParameters<UInt16, UInt16>(), GenericStructWith1TypeParameters<Int64>(), ()])
            @Expect("assertion#28: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()],
                    [GenericClassWith2TypeParameters<UInt16, UInt16>(), GenericStructWith1TypeParameters<Int64>(), ()])
            @Expect("assertion#29: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply(1i64, [], [GenericStructWith1TypeParameters<Int64>(), ()])
            @Expect("assertion#30: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply(StandardClassType<UInt16, Unit, UInt32>(), [TypeInfo.of<Float32>()],
                    [GenericStructWith1TypeParameters<Int64>(), ()])
            @Expect("assertion#31: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply("hello", [],
                    [GenericClassWith2TypeParameters<UInt16, UInt16>(), GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#32: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()],
                    [GenericClassWith2TypeParameters<UInt16, UInt16>(), GenericStructWith1TypeParameters<Int64>(), (),
                        114.514000f64])
            @Expect("assertion#33: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply(StandardClassType<UInt16, Unit, UInt32>(), [TypeInfo.of<Float32>()],
                    [GenericClassWith2TypeParameters<UInt16, UInt16>(), GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#34: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply(StandardClassType<UInt16, Unit, UInt32>(), [],
                    [GenericClassWith2TypeParameters<UInt16, UInt16>(), GenericStructWith1TypeParameters<Int64>(), (),
                        114.514000f64])
            @Expect("assertion#35: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply(StandardClassType<UInt16, Unit, UInt32>(), [], [(), GenericStructWith1TypeParameters<Int64>(), ()])
            @Expect("assertion#36: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [(), GenericStructWith1TypeParameters<Int64>(), ()])
            @Expect("assertion#37: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply(StandardClassType<UInt16, Unit, UInt32>(), [],
                    [GenericClassWith2TypeParameters<UInt16, UInt16>(), (), ()])
            @Expect("assertion#38: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericClassWith2TypeParameters<UInt16, UInt16>(), (), ()])
            @Expect("assertion#39: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply(StandardClassType<UInt16, Unit, UInt32>(), [],
                    [GenericClassWith2TypeParameters<UInt16, UInt16>(), GenericStructWith1TypeParameters<Int64>(),
                        123i64])
            @Expect("assertion#40: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()],
                    [GenericClassWith2TypeParameters<UInt16, UInt16>(), GenericStructWith1TypeParameters<Int64>(),
                        123i64])
            @Expect("assertion#41: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply("hello", [],
                    [GenericClassWith2TypeParameters<UInt16, UInt16>(), GenericStructWith1TypeParameters<Int64>(), ()])
            @Expect("assertion#42: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply("hello", [], [GenericStructWith1TypeParameters<Int64>(), ()])
            @Expect("assertion#43: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply(1i64, [],
                    [GenericClassWith2TypeParameters<UInt16, UInt16>(), GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#44: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply(1i64, [],
                    [GenericClassWith2TypeParameters<UInt16, UInt16>(), GenericStructWith1TypeParameters<Int64>(), (),
                        114.514000f64])
            @Expect("assertion#45: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply("hello", [], [(), GenericStructWith1TypeParameters<Int64>(), ()])
            @Expect("assertion#46: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply("hello", [], [GenericClassWith2TypeParameters<UInt16, UInt16>(), (), ()])
            @Expect("assertion#47: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply("hello", [],
                    [GenericClassWith2TypeParameters<UInt16, UInt16>(), GenericStructWith1TypeParameters<Int64>(),
                        123i64])
            @Expect("assertion#48: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt16, Unit, UInt32>>()
            .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
            .apply(StandardClassType<UInt16, Unit, UInt32>(),
                [GenericClassWith2TypeParameters<UInt16, UInt16>(), GenericStructWith1TypeParameters<Int64>(), ()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply(1i64,
                    [GenericClassWith2TypeParameters<UInt16, UInt16>(), GenericStructWith1TypeParameters<Int64>(), ()])
            @Expect("assertion#49: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<UInt16, Unit, UInt32>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply("hello",
                    [GenericClassWith2TypeParameters<UInt16, UInt16>(), GenericStructWith1TypeParameters<Int64>(), ()])
            @Expect("assertion#50: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<UInt16, Unit, UInt32>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply(StandardClassType<UInt16, Unit, UInt32>(), [GenericStructWith1TypeParameters<Int64>(), ()])
            @Expect("assertion#51: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Int64>(), ()])
            @Expect("assertion#52: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Int64>(), ()])
            @Expect("assertion#53: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply(StandardClassType<UInt16, Unit, UInt32>(),
                    [GenericClassWith2TypeParameters<UInt16, UInt16>(), GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#54: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply(1i64,
                    [GenericClassWith2TypeParameters<UInt16, UInt16>(), GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#55: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply("hello",
                    [GenericClassWith2TypeParameters<UInt16, UInt16>(), GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#56: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply(StandardClassType<UInt16, Unit, UInt32>(),
                    [GenericClassWith2TypeParameters<UInt16, UInt16>(), GenericStructWith1TypeParameters<Int64>(), (),
                        114.514000f64])
            @Expect("assertion#57: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply(1i64,
                    [GenericClassWith2TypeParameters<UInt16, UInt16>(), GenericStructWith1TypeParameters<Int64>(), (),
                        114.514000f64])
            @Expect("assertion#58: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply("hello",
                    [GenericClassWith2TypeParameters<UInt16, UInt16>(), GenericStructWith1TypeParameters<Int64>(), (),
                        114.514000f64])
            @Expect("assertion#59: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply(StandardClassType<UInt16, Unit, UInt32>(), [(), GenericStructWith1TypeParameters<Int64>(), ()])
            @Expect("assertion#60: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply(1i64, [(), GenericStructWith1TypeParameters<Int64>(), ()])
            @Expect("assertion#61: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply("hello", [(), GenericStructWith1TypeParameters<Int64>(), ()])
            @Expect("assertion#62: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply(StandardClassType<UInt16, Unit, UInt32>(),
                    [GenericClassWith2TypeParameters<UInt16, UInt16>(), (), ()])
            @Expect("assertion#63: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<UInt16, UInt16>(), (), ()])
            @Expect("assertion#64: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<UInt16, UInt16>(), (), ()])
            @Expect("assertion#65: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply(StandardClassType<UInt16, Unit, UInt32>(),
                    [GenericClassWith2TypeParameters<UInt16, UInt16>(), GenericStructWith1TypeParameters<Int64>(),
                        123i64])
            @Expect("assertion#66: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply(1i64,
                    [GenericClassWith2TypeParameters<UInt16, UInt16>(), GenericStructWith1TypeParameters<Int64>(),
                        123i64])
            @Expect("assertion#67: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply("hello",
                    [GenericClassWith2TypeParameters<UInt16, UInt16>(), GenericStructWith1TypeParameters<Int64>(),
                        123i64])
            @Expect("assertion#68: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_2 ends.")
    }

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

    @TestCase
    func TestCase_4(): Unit {
        // logger.info("testcase TestCase_4 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt32, Int64, Unit>>().getInstanceFunctions("classInstanceMemberFunction_5").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply(StandardClassType<UInt32, Int64, Unit>(), [], [123i64])
            @Expect("assertion#117: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [123i64])
            @Expect("assertion#118: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#119: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply(StandardClassType<UInt32, Int64, Unit>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#120: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#121: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [123i64, 114.514000f64])
            @Expect("assertion#122: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply(StandardClassType<UInt32, Int64, Unit>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#123: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply(StandardClassType<UInt32, Int64, Unit>(), [], [123i64, 114.514000f64])
            @Expect("assertion#124: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply(StandardClassType<UInt32, Int64, Unit>(), [], [114.514000f64])
            @Expect("assertion#125: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [114.514000f64])
            @Expect("assertion#126: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply("hello", [], [123i64])
            @Expect("assertion#127: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#128: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#129: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply(1i64, [], [123i64, 114.514000f64])
            @Expect("assertion#130: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply("hello", [], [114.514000f64])
            @Expect("assertion#131: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt32, Int64, Unit>>()
            .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
            .apply(StandardClassType<UInt32, Int64, Unit>(), [123i64])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply(1i64, [123i64])
            @Expect("assertion#132: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<UInt32, Int64, Unit>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply("hello", [123i64])
            @Expect("assertion#133: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<UInt32, Int64, Unit>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply(StandardClassType<UInt32, Int64, Unit>(), [])
            @Expect("assertion#134: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply(1i64, [])
            @Expect("assertion#135: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply("hello", [])
            @Expect("assertion#136: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply(StandardClassType<UInt32, Int64, Unit>(), [])
            @Expect("assertion#137: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply(1i64, [])
            @Expect("assertion#138: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply("hello", [])
            @Expect("assertion#139: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply(StandardClassType<UInt32, Int64, Unit>(), [123i64, 114.514000f64])
            @Expect("assertion#140: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply(1i64, [123i64, 114.514000f64])
            @Expect("assertion#141: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply("hello", [123i64, 114.514000f64])
            @Expect("assertion#142: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply(StandardClassType<UInt32, Int64, Unit>(), [114.514000f64])
            @Expect("assertion#143: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply(1i64, [114.514000f64])
            @Expect("assertion#144: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply("hello", [114.514000f64])
            @Expect("assertion#145: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_4 ends.")
    }
}
