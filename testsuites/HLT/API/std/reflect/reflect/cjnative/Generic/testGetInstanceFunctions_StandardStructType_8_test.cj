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
class testGetInstanceFunctions_StandardStructType_8 {
    @TestCase
    func TestCase_144(): Unit {
        // logger.info("testcase TestCase_144 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int64, Int32, UInt64>>().getInstanceFunctions("classInstanceMemberFunction_145").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_145")[0i64]
                .apply(StandardStructType<Int64, Int32, UInt64>(), [], [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#4493: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_145")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#4494: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_145")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4495: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_145")[0i64]
                .apply(StandardStructType<Int64, Int32, UInt64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4496: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_145")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4497: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_145")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#4498: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_145")[0i64]
                .apply(StandardStructType<Int64, Int32, UInt64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4499: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_145")[0i64]
                .apply(StandardStructType<Int64, Int32, UInt64>(), [],
                    [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#4500: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_145")[0i64]
                .apply(StandardStructType<Int64, Int32, UInt64>(), [], [()])
            @Expect("assertion#4501: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_145")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#4502: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_145")[0i64]
                .apply("hello", [], [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#4503: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_145")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4504: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_145")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4505: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_145")[0i64]
                .apply(1i64, [], [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#4506: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_145")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#4507: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int64, Int32, UInt64>>()
            .getInstanceFunctions("classInstanceMemberFunction_145")[0i64]
            .apply(StandardStructType<Int64, Int32, UInt64>(), [GenericStructWith1TypeParameters<Bool>()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_145")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#4508: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Int64, Int32, UInt64>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_145")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#4509: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Int64, Int32, UInt64>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_145")[0i64]
                .apply(StandardStructType<Int64, Int32, UInt64>(), [])
            @Expect("assertion#4510: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_145")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4511: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_145")[0i64]
                .apply("hello", [])
            @Expect("assertion#4512: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_145")[0i64]
                .apply(StandardStructType<Int64, Int32, UInt64>(), [])
            @Expect("assertion#4513: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_145")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4514: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_145")[0i64]
                .apply("hello", [])
            @Expect("assertion#4515: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_145")[0i64]
                .apply(StandardStructType<Int64, Int32, UInt64>(),
                    [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#4516: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_145")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#4517: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_145")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#4518: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_145")[0i64]
                .apply(StandardStructType<Int64, Int32, UInt64>(), [()])
            @Expect("assertion#4519: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_145")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#4520: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_145")[0i64]
                .apply("hello", [()])
            @Expect("assertion#4521: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_144 ends.")
    }

    @TestCase
    func TestCase_145(): Unit {
        // logger.info("testcase TestCase_145 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int64, Float32, Int64>>().getInstanceFunctions("classInstanceMemberFunction_146").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Float32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_146")[0i64]
                .apply(StandardStructType<Int64, Float32, Int64>(), [], [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#4522: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Float32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_146")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#4523: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Float32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_146")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4524: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Float32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_146")[0i64]
                .apply(StandardStructType<Int64, Float32, Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4525: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Float32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_146")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4526: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Float32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_146")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#4527: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Float32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_146")[0i64]
                .apply(StandardStructType<Int64, Float32, Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4528: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Float32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_146")[0i64]
                .apply(StandardStructType<Int64, Float32, Int64>(), [],
                    [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#4529: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Float32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_146")[0i64]
                .apply(StandardStructType<Int64, Float32, Int64>(), [], [()])
            @Expect("assertion#4530: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Float32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_146")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#4531: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Float32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_146")[0i64]
                .apply("hello", [], [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#4532: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Float32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_146")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4533: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Float32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_146")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4534: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Float32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_146")[0i64]
                .apply(1i64, [], [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#4535: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Float32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_146")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#4536: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int64, Float32, Int64>>()
            .getInstanceFunctions("classInstanceMemberFunction_146")[0i64]
            .apply(StandardStructType<Int64, Float32, Int64>(), [GenericStructWith1TypeParameters<Unit>()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Float32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_146")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#4537: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Int64, Float32, Int64>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Float32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_146")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#4538: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Int64, Float32, Int64>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Float32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_146")[0i64]
                .apply(StandardStructType<Int64, Float32, Int64>(), [])
            @Expect("assertion#4539: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Float32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_146")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4540: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Float32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_146")[0i64]
                .apply("hello", [])
            @Expect("assertion#4541: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Float32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_146")[0i64]
                .apply(StandardStructType<Int64, Float32, Int64>(), [])
            @Expect("assertion#4542: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Float32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_146")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4543: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Float32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_146")[0i64]
                .apply("hello", [])
            @Expect("assertion#4544: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Float32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_146")[0i64]
                .apply(StandardStructType<Int64, Float32, Int64>(),
                    [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#4545: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Float32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_146")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#4546: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Float32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_146")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#4547: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Float32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_146")[0i64]
                .apply(StandardStructType<Int64, Float32, Int64>(), [()])
            @Expect("assertion#4548: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Float32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_146")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#4549: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Float32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_146")[0i64]
                .apply("hello", [()])
            @Expect("assertion#4550: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_145 ends.")
    }

    @TestCase
    func TestCase_146(): Unit {
        // logger.info("testcase TestCase_146 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int64, UInt16, Bool>>().getInstanceFunctions("classInstanceMemberFunction_147").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_147")[0i64]
                .apply(StandardStructType<Int64, UInt16, Bool>(), [], [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#4551: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_147")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#4552: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_147")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4553: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_147")[0i64]
                .apply(StandardStructType<Int64, UInt16, Bool>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4554: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_147")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4555: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_147")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#4556: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_147")[0i64]
                .apply(StandardStructType<Int64, UInt16, Bool>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4557: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_147")[0i64]
                .apply(StandardStructType<Int64, UInt16, Bool>(), [],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#4558: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_147")[0i64]
                .apply(StandardStructType<Int64, UInt16, Bool>(), [], [()])
            @Expect("assertion#4559: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_147")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#4560: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_147")[0i64]
                .apply("hello", [], [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#4561: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_147")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4562: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_147")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4563: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_147")[0i64]
                .apply(1i64, [], [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#4564: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_147")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#4565: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int64, UInt16, Bool>>()
            .getInstanceFunctions("classInstanceMemberFunction_147")[0i64]
            .apply(StandardStructType<Int64, UInt16, Bool>(), [GenericStructWith1TypeParameters<Int64>()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_147")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#4566: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Int64, UInt16, Bool>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_147")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#4567: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Int64, UInt16, Bool>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_147")[0i64]
                .apply(StandardStructType<Int64, UInt16, Bool>(), [])
            @Expect("assertion#4568: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_147")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4569: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_147")[0i64]
                .apply("hello", [])
            @Expect("assertion#4570: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_147")[0i64]
                .apply(StandardStructType<Int64, UInt16, Bool>(), [])
            @Expect("assertion#4571: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_147")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4572: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_147")[0i64]
                .apply("hello", [])
            @Expect("assertion#4573: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_147")[0i64]
                .apply(StandardStructType<Int64, UInt16, Bool>(),
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#4574: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_147")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#4575: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_147")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#4576: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_147")[0i64]
                .apply(StandardStructType<Int64, UInt16, Bool>(), [()])
            @Expect("assertion#4577: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_147")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#4578: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_147")[0i64]
                .apply("hello", [()])
            @Expect("assertion#4579: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_146 ends.")
    }

    @TestCase
    func TestCase_147(): Unit {
        // logger.info("testcase TestCase_147 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt8, Int16, UInt64>>().getInstanceFunctions("classInstanceMemberFunction_148").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_148")[0i64]
                .apply(StandardStructType<UInt8, Int16, UInt64>(), [], [GenericStructWith1TypeParameters<Int16>()])
            @Expect("assertion#4580: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_148")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<Int16>()])
            @Expect("assertion#4581: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_148")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4582: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_148")[0i64]
                .apply(StandardStructType<UInt8, Int16, UInt64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4583: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_148")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4584: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_148")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#4585: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_148")[0i64]
                .apply(StandardStructType<UInt8, Int16, UInt64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4586: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_148")[0i64]
                .apply(StandardStructType<UInt8, Int16, UInt64>(), [],
                    [GenericStructWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#4587: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_148")[0i64]
                .apply(StandardStructType<UInt8, Int16, UInt64>(), [], [()])
            @Expect("assertion#4588: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_148")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#4589: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_148")[0i64]
                .apply("hello", [], [GenericStructWith1TypeParameters<Int16>()])
            @Expect("assertion#4590: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_148")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4591: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_148")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4592: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_148")[0i64]
                .apply(1i64, [], [GenericStructWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#4593: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_148")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#4594: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt8, Int16, UInt64>>()
            .getInstanceFunctions("classInstanceMemberFunction_148")[0i64]
            .apply(StandardStructType<UInt8, Int16, UInt64>(), [GenericStructWith1TypeParameters<Int16>()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_148")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Int16>()])
            @Expect("assertion#4595: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<UInt8, Int16, UInt64>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_148")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Int16>()])
            @Expect("assertion#4596: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<UInt8, Int16, UInt64>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_148")[0i64]
                .apply(StandardStructType<UInt8, Int16, UInt64>(), [])
            @Expect("assertion#4597: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_148")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4598: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_148")[0i64]
                .apply("hello", [])
            @Expect("assertion#4599: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_148")[0i64]
                .apply(StandardStructType<UInt8, Int16, UInt64>(), [])
            @Expect("assertion#4600: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_148")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4601: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_148")[0i64]
                .apply("hello", [])
            @Expect("assertion#4602: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_148")[0i64]
                .apply(StandardStructType<UInt8, Int16, UInt64>(),
                    [GenericStructWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#4603: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_148")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#4604: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_148")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#4605: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_148")[0i64]
                .apply(StandardStructType<UInt8, Int16, UInt64>(), [()])
            @Expect("assertion#4606: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_148")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#4607: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_148")[0i64]
                .apply("hello", [()])
            @Expect("assertion#4608: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_147 ends.")
    }

    @TestCase
    func TestCase_148(): Unit {
        // logger.info("testcase TestCase_148 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt32, Int8, Int64>>().getInstanceFunctions("classInstanceMemberFunction_149").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_149")[0i64]
                .apply(StandardStructType<UInt32, Int8, Int64>(), [], [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#4609: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_149")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#4610: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_149")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4611: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_149")[0i64]
                .apply(StandardStructType<UInt32, Int8, Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4612: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_149")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4613: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_149")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#4614: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_149")[0i64]
                .apply(StandardStructType<UInt32, Int8, Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4615: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_149")[0i64]
                .apply(StandardStructType<UInt32, Int8, Int64>(), [],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#4616: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_149")[0i64]
                .apply(StandardStructType<UInt32, Int8, Int64>(), [], [()])
            @Expect("assertion#4617: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_149")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#4618: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_149")[0i64]
                .apply("hello", [], [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#4619: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_149")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4620: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_149")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4621: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_149")[0i64]
                .apply(1i64, [], [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#4622: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_149")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#4623: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt32, Int8, Int64>>()
            .getInstanceFunctions("classInstanceMemberFunction_149")[0i64]
            .apply(StandardStructType<UInt32, Int8, Int64>(), [GenericStructWith1TypeParameters<Int64>()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_149")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#4624: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<UInt32, Int8, Int64>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_149")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#4625: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<UInt32, Int8, Int64>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_149")[0i64]
                .apply(StandardStructType<UInt32, Int8, Int64>(), [])
            @Expect("assertion#4626: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_149")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4627: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_149")[0i64]
                .apply("hello", [])
            @Expect("assertion#4628: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_149")[0i64]
                .apply(StandardStructType<UInt32, Int8, Int64>(), [])
            @Expect("assertion#4629: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_149")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4630: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_149")[0i64]
                .apply("hello", [])
            @Expect("assertion#4631: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_149")[0i64]
                .apply(StandardStructType<UInt32, Int8, Int64>(),
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#4632: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_149")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#4633: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_149")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#4634: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_149")[0i64]
                .apply(StandardStructType<UInt32, Int8, Int64>(), [()])
            @Expect("assertion#4635: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_149")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#4636: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_149")[0i64]
                .apply("hello", [()])
            @Expect("assertion#4637: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_148 ends.")
    }
}
