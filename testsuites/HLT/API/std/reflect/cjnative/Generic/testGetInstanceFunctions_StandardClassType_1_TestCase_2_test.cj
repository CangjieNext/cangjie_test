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
}
