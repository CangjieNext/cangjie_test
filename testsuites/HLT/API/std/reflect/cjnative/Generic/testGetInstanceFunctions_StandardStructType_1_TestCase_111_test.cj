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
}
