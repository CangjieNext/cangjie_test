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
class testGetInstanceFunctions_StandardStructType_1 {
    @TestCase
    func TestCase_109(): Unit {
        // logger.info("testcase TestCase_109 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Bool, Unit, UInt64>>().getInstanceFunctions("classInstanceMemberFunction_110").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_110")[0i64]
                .apply(StandardStructType<Bool, Unit, UInt64>(), [], [])
            @Expect("assertion#3477: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_110")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [])
            @Expect("assertion#3478: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_110")[0i64]
                .apply(1i64, [], [114.514000f64])
            @Expect("assertion#3479: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_110")[0i64]
                .apply(StandardStructType<Bool, Unit, UInt64>(), [TypeInfo.of<Float32>()], [114.514000f64])
            @Expect("assertion#3480: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_110")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#3481: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_110")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [114.514000f64])
            @Expect("assertion#3482: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Bool, Unit, UInt64>>()
            .getInstanceFunctions("classInstanceMemberFunction_110")[0i64]
            .apply(StandardStructType<Bool, Unit, UInt64>(), [])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_110")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3483: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Bool, Unit, UInt64>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_110")[0i64]
                .apply("hello", [])
            @Expect("assertion#3484: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Bool, Unit, UInt64>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_110")[0i64]
                .apply(StandardStructType<Bool, Unit, UInt64>(), [114.514000f64])
            @Expect("assertion#3485: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_110")[0i64]
                .apply(1i64, [114.514000f64])
            @Expect("assertion#3486: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_110")[0i64]
                .apply("hello", [114.514000f64])
            @Expect("assertion#3487: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("testcase TestCase_109 ends.")
    }

    @TestCase
    func TestCase_110(): Unit {
        // logger.info("testcase TestCase_110 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int16, Int16, Float64>>().getInstanceFunctions("classInstanceMemberFunction_111").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int16, Int16, Float64>>()
            .getInstanceFunctions("classInstanceMemberFunction_111")[0i64]
            .apply(StandardStructType<Int16, Int16, Float64>(),
                [TypeInfo.of<Bool>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int8>()], [])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_111")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#3488: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_111")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#3489: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_111")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int8>()], [114.514000f64])
            @Expect("assertion#3490: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_111")[0i64]
                .apply(StandardStructType<Int16, Int16, Float64>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Int8>()],
                    [114.514000f64])
            @Expect("assertion#3491: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_111")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [114.514000f64])
            @Expect("assertion#3492: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_111")[0i64]
                .apply(StandardStructType<Int16, Int16, Float64>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#3493: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_111")[0i64]
                .apply(StandardStructType<Int16, Int16, Float64>(), [TypeInfo.of<Bool>(), TypeInfo.of<UInt64>()],
                    [114.514000f64])
            @Expect("assertion#3494: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_111")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#3495: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Int16, Int16, Float64>\", but now it`s \"String\"")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_111")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#3496: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_111")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#3497: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_111")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#3498: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_111")[0i64]
                .apply(StandardStructType<Int16, Int16, Float64>(), [])
            @Expect("assertion#3499: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_111")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3500: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_111")[0i64]
                .apply("hello", [])
            @Expect("assertion#3501: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_111")[0i64]
                .apply(StandardStructType<Int16, Int16, Float64>(), [114.514000f64])
            @Expect("assertion#3502: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_111")[0i64]
                .apply(1i64, [114.514000f64])
            @Expect("assertion#3503: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_111")[0i64]
                .apply("hello", [114.514000f64])
            @Expect("assertion#3504: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_110 ends.")
    }

    @TestCase
    func TestCase_111(): Unit {
        // logger.info("testcase TestCase_111 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Float64, Float64, Int64>>().getInstanceFunctions("classInstanceMemberFunction_112").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_112")[0i64]
                .apply(StandardStructType<Float64, Float64, Int64>(), [],
                    [GenericClassWith1TypeParameters<Float64>(), GenericClassWith1TypeParameters<Unit>(),
                        GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#3505: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_112")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()],
                    [GenericClassWith1TypeParameters<Float64>(), GenericClassWith1TypeParameters<Unit>(),
                        GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#3506: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_112")[0i64]
                .apply(1i64, [], [GenericClassWith1TypeParameters<Unit>(), GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#3507: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_112")[0i64]
                .apply(StandardStructType<Float64, Float64, Int64>(), [TypeInfo.of<Float32>()],
                    [GenericClassWith1TypeParameters<Unit>(), GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#3508: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_112")[0i64]
                .apply("hello", [], [GenericClassWith1TypeParameters<Float64>(), GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#3509: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_112")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()],
                    [GenericClassWith1TypeParameters<Float64>(), GenericClassWith1TypeParameters<Unit>(),
                        GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#3510: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_112")[0i64]
                .apply(StandardStructType<Float64, Float64, Int64>(), [TypeInfo.of<Float32>()],
                    [GenericClassWith1TypeParameters<Float64>(), GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#3511: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_112")[0i64]
                .apply(StandardStructType<Float64, Float64, Int64>(), [],
                    [GenericClassWith1TypeParameters<Float64>(), GenericClassWith1TypeParameters<Unit>(),
                        GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#3512: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_112")[0i64]
                .apply(StandardStructType<Float64, Float64, Int64>(), [],
                    [(), GenericClassWith1TypeParameters<Unit>(), GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#3513: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_112")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()],
                    [(), GenericClassWith1TypeParameters<Unit>(), GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#3514: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_112")[0i64]
                .apply(StandardStructType<Float64, Float64, Int64>(), [],
                    [GenericClassWith1TypeParameters<Float64>(), (), GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#3515: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_112")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()],
                    [GenericClassWith1TypeParameters<Float64>(), (), GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#3516: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_112")[0i64]
                .apply(StandardStructType<Float64, Float64, Int64>(), [],
                    [GenericClassWith1TypeParameters<Float64>(), GenericClassWith1TypeParameters<Unit>(), ()])
            @Expect("assertion#3517: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_112")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()],
                    [GenericClassWith1TypeParameters<Float64>(), GenericClassWith1TypeParameters<Unit>(), ()])
            @Expect("assertion#3518: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_112")[0i64]
                .apply("hello", [],
                    [GenericClassWith1TypeParameters<Float64>(), GenericClassWith1TypeParameters<Unit>(),
                        GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#3519: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_112")[0i64]
                .apply("hello", [], [GenericClassWith1TypeParameters<Unit>(), GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#3520: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_112")[0i64]
                .apply(1i64, [], [GenericClassWith1TypeParameters<Float64>(), GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#3521: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_112")[0i64]
                .apply(1i64, [],
                    [GenericClassWith1TypeParameters<Float64>(), GenericClassWith1TypeParameters<Unit>(),
                        GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#3522: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_112")[0i64]
                .apply("hello", [],
                    [(), GenericClassWith1TypeParameters<Unit>(), GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#3523: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_112")[0i64]
                .apply("hello", [],
                    [GenericClassWith1TypeParameters<Float64>(), (), GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#3524: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_112")[0i64]
                .apply("hello", [],
                    [GenericClassWith1TypeParameters<Float64>(), GenericClassWith1TypeParameters<Unit>(), ()])
            @Expect("assertion#3525: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Float64, Float64, Int64>>()
            .getInstanceFunctions("classInstanceMemberFunction_112")[0i64]
            .apply(StandardStructType<Float64, Float64, Int64>(),
                [GenericClassWith1TypeParameters<Float64>(), GenericClassWith1TypeParameters<Unit>(),
                    GenericClassWith1TypeParameters<Float64>()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_112")[0i64]
                .apply(1i64,
                    [GenericClassWith1TypeParameters<Float64>(), GenericClassWith1TypeParameters<Unit>(),
                        GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#3526: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Float64, Float64, Int64>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_112")[0i64]
                .apply("hello",
                    [GenericClassWith1TypeParameters<Float64>(), GenericClassWith1TypeParameters<Unit>(),
                        GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#3527: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Float64, Float64, Int64>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_112")[0i64]
                .apply(StandardStructType<Float64, Float64, Int64>(),
                    [GenericClassWith1TypeParameters<Unit>(), GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#3528: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_112")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Unit>(), GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#3529: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_112")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Unit>(), GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#3530: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_112")[0i64]
                .apply(StandardStructType<Float64, Float64, Int64>(),
                    [GenericClassWith1TypeParameters<Float64>(), GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#3531: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_112")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Float64>(), GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#3532: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_112")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Float64>(), GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#3533: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_112")[0i64]
                .apply(StandardStructType<Float64, Float64, Int64>(),
                    [GenericClassWith1TypeParameters<Float64>(), GenericClassWith1TypeParameters<Unit>(),
                        GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#3534: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_112")[0i64]
                .apply(1i64,
                    [GenericClassWith1TypeParameters<Float64>(), GenericClassWith1TypeParameters<Unit>(),
                        GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#3535: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_112")[0i64]
                .apply("hello",
                    [GenericClassWith1TypeParameters<Float64>(), GenericClassWith1TypeParameters<Unit>(),
                        GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#3536: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_112")[0i64]
                .apply(StandardStructType<Float64, Float64, Int64>(),
                    [(), GenericClassWith1TypeParameters<Unit>(), GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#3537: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_112")[0i64]
                .apply(1i64, [(), GenericClassWith1TypeParameters<Unit>(), GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#3538: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_112")[0i64]
                .apply("hello", [(), GenericClassWith1TypeParameters<Unit>(), GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#3539: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_112")[0i64]
                .apply(StandardStructType<Float64, Float64, Int64>(),
                    [GenericClassWith1TypeParameters<Float64>(), (), GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#3540: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_112")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Float64>(), (), GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#3541: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_112")[0i64]
                .apply("hello",
                    [GenericClassWith1TypeParameters<Float64>(), (), GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#3542: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_112")[0i64]
                .apply(StandardStructType<Float64, Float64, Int64>(),
                    [GenericClassWith1TypeParameters<Float64>(), GenericClassWith1TypeParameters<Unit>(), ()])
            @Expect("assertion#3543: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_112")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Float64>(), GenericClassWith1TypeParameters<Unit>(), ()])
            @Expect("assertion#3544: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_112")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Float64>(), GenericClassWith1TypeParameters<Unit>(), ()])
            @Expect("assertion#3545: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_111 ends.")
    }

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

    @TestCase
    func TestCase_113(): Unit {
        // logger.info("testcase TestCase_113 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Float32, UInt64, Float32>>().getInstanceFunctions("classInstanceMemberFunction_114").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_114")[0i64]
                .apply(StandardStructType<Float32, UInt64, Float32>(), [], [123i64])
            @Expect("assertion#3594: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_114")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [123i64])
            @Expect("assertion#3595: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_114")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#3596: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_114")[0i64]
                .apply(StandardStructType<Float32, UInt64, Float32>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#3597: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_114")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#3598: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_114")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [123i64, 114.514000f64])
            @Expect("assertion#3599: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_114")[0i64]
                .apply(StandardStructType<Float32, UInt64, Float32>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#3600: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_114")[0i64]
                .apply(StandardStructType<Float32, UInt64, Float32>(), [], [123i64, 114.514000f64])
            @Expect("assertion#3601: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_114")[0i64]
                .apply(StandardStructType<Float32, UInt64, Float32>(), [], [114.514000f64])
            @Expect("assertion#3602: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_114")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [114.514000f64])
            @Expect("assertion#3603: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_114")[0i64]
                .apply("hello", [], [123i64])
            @Expect("assertion#3604: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_114")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#3605: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_114")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#3606: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_114")[0i64]
                .apply(1i64, [], [123i64, 114.514000f64])
            @Expect("assertion#3607: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_114")[0i64]
                .apply("hello", [], [114.514000f64])
            @Expect("assertion#3608: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Float32, UInt64, Float32>>()
            .getInstanceFunctions("classInstanceMemberFunction_114")[0i64]
            .apply(StandardStructType<Float32, UInt64, Float32>(), [123i64])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_114")[0i64]
                .apply(1i64, [123i64])
            @Expect("assertion#3609: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Float32, UInt64, Float32>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_114")[0i64]
                .apply("hello", [123i64])
            @Expect("assertion#3610: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Float32, UInt64, Float32>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_114")[0i64]
                .apply(StandardStructType<Float32, UInt64, Float32>(), [])
            @Expect("assertion#3611: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_114")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3612: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_114")[0i64]
                .apply("hello", [])
            @Expect("assertion#3613: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_114")[0i64]
                .apply(StandardStructType<Float32, UInt64, Float32>(), [])
            @Expect("assertion#3614: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_114")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3615: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_114")[0i64]
                .apply("hello", [])
            @Expect("assertion#3616: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_114")[0i64]
                .apply(StandardStructType<Float32, UInt64, Float32>(), [123i64, 114.514000f64])
            @Expect("assertion#3617: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_114")[0i64]
                .apply(1i64, [123i64, 114.514000f64])
            @Expect("assertion#3618: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_114")[0i64]
                .apply("hello", [123i64, 114.514000f64])
            @Expect("assertion#3619: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_114")[0i64]
                .apply(StandardStructType<Float32, UInt64, Float32>(), [114.514000f64])
            @Expect("assertion#3620: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_114")[0i64]
                .apply(1i64, [114.514000f64])
            @Expect("assertion#3621: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_114")[0i64]
                .apply("hello", [114.514000f64])
            @Expect("assertion#3622: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_113 ends.")
    }
}
