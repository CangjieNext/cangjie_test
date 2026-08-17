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
class testGetInstanceFunctions_StandardStructType_12 {
    @TestCase
    func TestCase_165(): Unit {
        // logger.info("testcase TestCase_165 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Bool, UInt32, UInt64>>().getInstanceFunctions("classInstanceMemberFunction_166").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Bool, UInt32, UInt64>>()
            .getInstanceFunctions("classInstanceMemberFunction_166")[0i64]
            .apply(StandardStructType<Bool, UInt32, UInt64>(),
                [TypeInfo.of<Float32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float32>()], [NonGenericClass()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_166")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Float32>()], [NonGenericClass()])
            @Expect("assertion#5152: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_166")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<UInt8>()], [NonGenericClass()])
            @Expect("assertion#5153: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_166")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#5154: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_166")[0i64]
                .apply(StandardStructType<Bool, UInt32, UInt64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#5155: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_166")[0i64]
                .apply("hello",
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#5156: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_166")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#5157: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_166")[0i64]
                .apply(StandardStructType<Bool, UInt32, UInt64>(), [TypeInfo.of<Float32>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#5158: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_166")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float32>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#5159: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_166")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<Float32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5160: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_166")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<UInt8>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5161: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_166")[0i64]
                .apply(StandardStructType<Bool, UInt32, UInt64>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5162: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_166")[0i64]
                .apply(StandardStructType<Bool, UInt32, UInt64>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#5163: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_166")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#5164: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_166")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#5165: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_166")[0i64]
                .apply(StandardStructType<Bool, UInt32, UInt64>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#5166: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_166")[0i64]
                .apply(StandardStructType<Bool, UInt32, UInt64>(), [TypeInfo.of<Float32>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#5167: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_166")[0i64]
                .apply(StandardStructType<Bool, UInt32, UInt64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#5168: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_166")[0i64]
                .apply(StandardStructType<Bool, UInt32, UInt64>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float32>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5169: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_166")[0i64]
                .apply(StandardStructType<Bool, UInt32, UInt64>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#5170: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_166")[0i64]
                .apply(StandardStructType<Bool, UInt32, UInt64>(), [NonGenericClass()])
            @Expect("assertion#5171: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_166")[0i64]
                .apply(1i64, [NonGenericClass()])
            @Expect("assertion#5172: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_166")[0i64]
                .apply("hello", [NonGenericClass()])
            @Expect("assertion#5173: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_166")[0i64]
                .apply(StandardStructType<Bool, UInt32, UInt64>(), [])
            @Expect("assertion#5174: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_166")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5175: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_166")[0i64]
                .apply("hello", [])
            @Expect("assertion#5176: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_166")[0i64]
                .apply(StandardStructType<Bool, UInt32, UInt64>(), [])
            @Expect("assertion#5177: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_166")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5178: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_166")[0i64]
                .apply("hello", [])
            @Expect("assertion#5179: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_166")[0i64]
                .apply(StandardStructType<Bool, UInt32, UInt64>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5180: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_166")[0i64]
                .apply(1i64, [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5181: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_166")[0i64]
                .apply("hello", [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5182: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_166")[0i64]
                .apply(StandardStructType<Bool, UInt32, UInt64>(), [()])
            @Expect("assertion#5183: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_166")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#5184: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_166")[0i64]
                .apply("hello", [()])
            @Expect("assertion#5185: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_165 ends.")
    }
}
