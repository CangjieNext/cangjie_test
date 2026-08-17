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
class testGetStaticFunctions_StandardClassType_9 {
    @TestCase
    func TestCase_261(): Unit {
        // logger.info("testcase TestCase_261 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Bool, UInt8, Unit>>().getStaticFunctions("classStaticMemberFunction_44").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt8, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_44")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, UInt8, Unit>>(), [],
                    [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#7781: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt8, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_44")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#7782: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt8, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_44")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#7783: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt8, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_44")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, UInt8, Unit>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7784: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt8, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_44")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, UInt8, Unit>>(), [], [])
            @Expect("assertion#7785: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt8, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_44")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7786: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt8, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_44")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, UInt8, Unit>>(), [],
                    [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#7787: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt8, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_44")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#7788: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt8, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_44")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, UInt8, Unit>>(), [], [()])
            @Expect("assertion#7789: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt8, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_44")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#7790: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Bool, UInt8, Unit>>()
            .getStaticFunctions("classStaticMemberFunction_44")[0i64]
            .apply(TypeInfo.of<StandardClassType<Bool, UInt8, Unit>>(), [GenericStructWith2TypeParameters<Bool, Bool>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt8, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_44")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#7791: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Bool, UInt8, Unit> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt8, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_44")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, UInt8, Unit>>(), [])
            @Expect("assertion#7792: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt8, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_44")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7793: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Bool, UInt8, Unit> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt8, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_44")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, UInt8, Unit>>(), [])
            @Expect("assertion#7794: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt8, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_44")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7795: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Bool, UInt8, Unit> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt8, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_44")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, UInt8, Unit>>(),
                    [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#7796: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt8, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_44")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#7797: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Bool, UInt8, Unit> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt8, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_44")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, UInt8, Unit>>(), [()])
            @Expect("assertion#7798: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt8, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_44")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#7799: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Bool, UInt8, Unit> got.")
        }
        // logger.info("testcase TestCase_261 ends.")
    }
}
