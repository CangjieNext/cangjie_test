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
class testGetInstanceFunctions_StandardClassType_9 {
    @TestCase
    func TestCase_41(): Unit {
        // logger.info("testcase TestCase_41 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt32, Unit, UInt64>>().getInstanceFunctions("classInstanceMemberFunction_42").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_42")[0i64]
                .apply(StandardClassType<UInt32, Unit, UInt64>(), [], [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#1190: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_42")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#1191: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_42")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#1192: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_42")[0i64]
                .apply(StandardClassType<UInt32, Unit, UInt64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#1193: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_42")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#1194: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_42")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#1195: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_42")[0i64]
                .apply(StandardClassType<UInt32, Unit, UInt64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#1196: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_42")[0i64]
                .apply(StandardClassType<UInt32, Unit, UInt64>(), [],
                    [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#1197: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_42")[0i64]
                .apply(StandardClassType<UInt32, Unit, UInt64>(), [], [()])
            @Expect("assertion#1198: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_42")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#1199: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_42")[0i64]
                .apply("hello", [], [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#1200: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_42")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#1201: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_42")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#1202: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_42")[0i64]
                .apply(1i64, [], [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#1203: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_42")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#1204: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt32, Unit, UInt64>>()
            .getInstanceFunctions("classInstanceMemberFunction_42")[0i64]
            .apply(StandardClassType<UInt32, Unit, UInt64>(), [GenericStructWith2TypeParameters<Bool, Bool>()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_42")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#1205: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<UInt32, Unit, UInt64>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_42")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#1206: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<UInt32, Unit, UInt64>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_42")[0i64]
                .apply(StandardClassType<UInt32, Unit, UInt64>(), [])
            @Expect("assertion#1207: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_42")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1208: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_42")[0i64]
                .apply("hello", [])
            @Expect("assertion#1209: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_42")[0i64]
                .apply(StandardClassType<UInt32, Unit, UInt64>(), [])
            @Expect("assertion#1210: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_42")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1211: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_42")[0i64]
                .apply("hello", [])
            @Expect("assertion#1212: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_42")[0i64]
                .apply(StandardClassType<UInt32, Unit, UInt64>(),
                    [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#1213: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_42")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#1214: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_42")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#1215: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_42")[0i64]
                .apply(StandardClassType<UInt32, Unit, UInt64>(), [()])
            @Expect("assertion#1216: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_42")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#1217: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_42")[0i64]
                .apply("hello", [()])
            @Expect("assertion#1218: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_41 ends.")
    }
}
