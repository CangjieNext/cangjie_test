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
class testGetInstanceFunctions_StandardClassType_8 {
    @TestCase
    func TestCase_35(): Unit {
        // logger.info("testcase TestCase_35 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt16, UInt16, UInt64>>().getInstanceFunctions("classInstanceMemberFunction_36").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_36")[0i64]
                .apply(StandardClassType<UInt16, UInt16, UInt64>(), [], [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#1016: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_36")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#1017: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_36")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#1018: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_36")[0i64]
                .apply(StandardClassType<UInt16, UInt16, UInt64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#1019: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_36")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#1020: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_36")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#1021: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_36")[0i64]
                .apply(StandardClassType<UInt16, UInt16, UInt64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#1022: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_36")[0i64]
                .apply(StandardClassType<UInt16, UInt16, UInt64>(), [],
                    [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#1023: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_36")[0i64]
                .apply(StandardClassType<UInt16, UInt16, UInt64>(), [], [()])
            @Expect("assertion#1024: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_36")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#1025: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_36")[0i64]
                .apply("hello", [], [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#1026: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_36")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#1027: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_36")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#1028: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_36")[0i64]
                .apply(1i64, [], [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#1029: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_36")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#1030: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt16, UInt16, UInt64>>()
            .getInstanceFunctions("classInstanceMemberFunction_36")[0i64]
            .apply(StandardClassType<UInt16, UInt16, UInt64>(), [GenericStructWith1TypeParameters<Bool>()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_36")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#1031: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<UInt16, UInt16, UInt64>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_36")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#1032: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<UInt16, UInt16, UInt64>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_36")[0i64]
                .apply(StandardClassType<UInt16, UInt16, UInt64>(), [])
            @Expect("assertion#1033: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_36")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1034: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_36")[0i64]
                .apply("hello", [])
            @Expect("assertion#1035: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_36")[0i64]
                .apply(StandardClassType<UInt16, UInt16, UInt64>(), [])
            @Expect("assertion#1036: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_36")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1037: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_36")[0i64]
                .apply("hello", [])
            @Expect("assertion#1038: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_36")[0i64]
                .apply(StandardClassType<UInt16, UInt16, UInt64>(),
                    [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#1039: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_36")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#1040: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_36")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#1041: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_36")[0i64]
                .apply(StandardClassType<UInt16, UInt16, UInt64>(), [()])
            @Expect("assertion#1042: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_36")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#1043: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_36")[0i64]
                .apply("hello", [()])
            @Expect("assertion#1044: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_35 ends.")
    }
}
