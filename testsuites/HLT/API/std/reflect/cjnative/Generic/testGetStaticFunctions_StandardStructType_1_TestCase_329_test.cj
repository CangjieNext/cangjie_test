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
class testGetStaticFunctions_StandardStructType_1 {
    @TestCase
    func TestCase_329(): Unit {
        // logger.info("testcase TestCase_329 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Bool, UInt32, Int32>>().getStaticFunctions("classStaticMemberFunction_112").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_112")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt32, Int32>>(), [],
                    [1i32, NonGenericClass(), GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#9683: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_112")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [1i32, NonGenericClass(), GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#9684: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_112")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [NonGenericClass(), GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#9685: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_112")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt32, Int32>>(), [TypeInfo.of<Float32>()],
                    [NonGenericClass(), GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#9686: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_112")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt32, Int32>>(), [], [1i32, NonGenericClass()])
            @Expect("assertion#9687: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_112")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [1i32, NonGenericClass()])
            @Expect("assertion#9688: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_112")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt32, Int32>>(), [],
                    [1i32, NonGenericClass(), GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#9689: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_112")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [1i32, NonGenericClass(), GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#9690: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_112")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt32, Int32>>(), [],
                    [114.514000f64, NonGenericClass(), GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#9691: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_112")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [114.514000f64, NonGenericClass(), GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#9692: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_112")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt32, Int32>>(), [],
                    [1i32, (), GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#9693: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_112")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [1i32, (), GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#9694: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_112")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt32, Int32>>(), [], [1i32, NonGenericClass(), ()])
            @Expect("assertion#9695: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_112")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [1i32, NonGenericClass(), ()])
            @Expect("assertion#9696: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Bool, UInt32, Int32>>()
            .getStaticFunctions("classStaticMemberFunction_112")[0i64]
            .apply(TypeInfo.of<StandardStructType<Bool, UInt32, Int32>>(),
                [1i32, NonGenericClass(), GenericClassWith1TypeParameters<Int64>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_112")[0i64]
                .apply(TypeInfo.of<Int64>(), [1i32, NonGenericClass(), GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#9697: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, UInt32, Int32> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_112")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt32, Int32>>(),
                    [NonGenericClass(), GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#9698: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_112")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass(), GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#9699: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, UInt32, Int32> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_112")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt32, Int32>>(), [1i32, NonGenericClass()])
            @Expect("assertion#9700: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_112")[0i64]
                .apply(TypeInfo.of<Int64>(), [1i32, NonGenericClass()])
            @Expect("assertion#9701: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, UInt32, Int32> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_112")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt32, Int32>>(),
                    [1i32, NonGenericClass(), GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#9702: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_112")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [1i32, NonGenericClass(), GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#9703: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, UInt32, Int32> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_112")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt32, Int32>>(),
                    [114.514000f64, NonGenericClass(), GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#9704: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_112")[0i64]
                .apply(TypeInfo.of<Int64>(), [114.514000f64, NonGenericClass(), GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#9705: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, UInt32, Int32> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_112")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt32, Int32>>(),
                    [1i32, (), GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#9706: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_112")[0i64]
                .apply(TypeInfo.of<Int64>(), [1i32, (), GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#9707: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, UInt32, Int32> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_112")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt32, Int32>>(), [1i32, NonGenericClass(), ()])
            @Expect("assertion#9708: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_112")[0i64]
                .apply(TypeInfo.of<Int64>(), [1i32, NonGenericClass(), ()])
            @Expect("assertion#9709: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, UInt32, Int32> got.")
        }
        // logger.info("testcase TestCase_329 ends.")
    }
}
