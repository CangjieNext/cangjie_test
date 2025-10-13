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
class testGetInstanceFunctions_StandardStructType_12 {
    @TestCase
    func TestCase_164(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<Int64, Int64, Int8>>().getInstanceFunctions("classInstanceMemberFunction_165").size)
        TypeInfo
            .of<StandardStructType<Int64, Int64, Int8>>()
            .getInstanceFunctions("classInstanceMemberFunction_165")[0i64]
            .apply(StandardStructType<Int64, Int64, Int8>(),
                [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int8>()], [NonGenericClass()])
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_165")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Int8>()], [NonGenericClass()])
            @Expect("assertion#5118: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_165")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [NonGenericClass()])
            @Expect("assertion#5119: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_165")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#5120: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_165")[0i64]
                .apply(StandardStructType<Int64, Int64, Int8>(), [TypeInfo.of<Int64>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#5121: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_165")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#5122: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_165")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#5123: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_165")[0i64]
                .apply(StandardStructType<Int64, Int64, Int8>(), [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#5124: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_165")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#5125: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_165")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Int8>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5126: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_165")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5127: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_165")[0i64]
                .apply(StandardStructType<Int64, Int64, Int8>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5128: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_165")[0i64]
                .apply(StandardStructType<Int64, Int64, Int8>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#5129: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_165")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#5130: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_165")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#5131: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_165")[0i64]
                .apply(StandardStructType<Int64, Int64, Int8>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#5132: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_165")[0i64]
                .apply(StandardStructType<Int64, Int64, Int8>(), [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#5133: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_165")[0i64]
                .apply(StandardStructType<Int64, Int64, Int8>(), [TypeInfo.of<Int64>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#5134: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_165")[0i64]
                .apply(StandardStructType<Int64, Int64, Int8>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int8>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5135: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_165")[0i64]
                .apply(StandardStructType<Int64, Int64, Int8>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#5136: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_165")[0i64]
                .apply(StandardStructType<Int64, Int64, Int8>(), [NonGenericClass()])
            @Expect("assertion#5137: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_165")[0i64]
                .apply(1i64, [NonGenericClass()])
            @Expect("assertion#5138: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_165")[0i64]
                .apply("hello", [NonGenericClass()])
            @Expect("assertion#5139: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_165")[0i64]
                .apply(StandardStructType<Int64, Int64, Int8>(), [])
            @Expect("assertion#5140: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_165")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5141: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_165")[0i64]
                .apply("hello", [])
            @Expect("assertion#5142: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_165")[0i64]
                .apply(StandardStructType<Int64, Int64, Int8>(), [])
            @Expect("assertion#5143: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_165")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5144: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_165")[0i64]
                .apply("hello", [])
            @Expect("assertion#5145: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_165")[0i64]
                .apply(StandardStructType<Int64, Int64, Int8>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5146: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_165")[0i64]
                .apply(1i64, [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5147: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_165")[0i64]
                .apply("hello", [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5148: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_165")[0i64]
                .apply(StandardStructType<Int64, Int64, Int8>(), [()])
            @Expect("assertion#5149: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_165")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#5150: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_165")[0i64]
                .apply("hello", [()])
            @Expect("assertion#5151: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_165(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<Bool, UInt32, UInt64>>().getInstanceFunctions("classInstanceMemberFunction_166").size)
        TypeInfo
            .of<StandardStructType<Bool, UInt32, UInt64>>()
            .getInstanceFunctions("classInstanceMemberFunction_166")[0i64]
            .apply(StandardStructType<Bool, UInt32, UInt64>(),
                [TypeInfo.of<Float32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float32>()], [NonGenericClass()])
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_166")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Float32>()], [NonGenericClass()])
            @Expect("assertion#5152: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_166")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<UInt8>()], [NonGenericClass()])
            @Expect("assertion#5153: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_166")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#5154: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_166")[0i64]
                .apply(StandardStructType<Bool, UInt32, UInt64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#5155: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
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
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_166")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#5157: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_166")[0i64]
                .apply(StandardStructType<Bool, UInt32, UInt64>(), [TypeInfo.of<Float32>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#5158: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
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
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_166")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<Float32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5160: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_166")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<UInt8>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5161: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
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
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_166")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#5164: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_166")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#5165: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
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
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_166")[0i64]
                .apply(StandardStructType<Bool, UInt32, UInt64>(), [TypeInfo.of<Float32>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#5167: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_166")[0i64]
                .apply(StandardStructType<Bool, UInt32, UInt64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#5168: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
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
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_166")[0i64]
                .apply(StandardStructType<Bool, UInt32, UInt64>(), [NonGenericClass()])
            @Expect("assertion#5171: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_166")[0i64]
                .apply(1i64, [NonGenericClass()])
            @Expect("assertion#5172: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_166")[0i64]
                .apply("hello", [NonGenericClass()])
            @Expect("assertion#5173: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_166")[0i64]
                .apply(StandardStructType<Bool, UInt32, UInt64>(), [])
            @Expect("assertion#5174: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_166")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5175: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_166")[0i64]
                .apply("hello", [])
            @Expect("assertion#5176: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_166")[0i64]
                .apply(StandardStructType<Bool, UInt32, UInt64>(), [])
            @Expect("assertion#5177: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_166")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5178: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_166")[0i64]
                .apply("hello", [])
            @Expect("assertion#5179: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_166")[0i64]
                .apply(StandardStructType<Bool, UInt32, UInt64>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5180: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_166")[0i64]
                .apply(1i64, [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5181: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_166")[0i64]
                .apply("hello", [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5182: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_166")[0i64]
                .apply(StandardStructType<Bool, UInt32, UInt64>(), [()])
            @Expect("assertion#5183: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_166")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#5184: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_166")[0i64]
                .apply("hello", [()])
            @Expect("assertion#5185: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_166(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<Int64, Bool, UInt16>>().getInstanceFunctions("classInstanceMemberFunction_167").size)
        TypeInfo
            .of<StandardStructType<Int64, Bool, UInt16>>()
            .getInstanceFunctions("classInstanceMemberFunction_167")[0i64]
            .apply(StandardStructType<Int64, Bool, UInt16>(),
                [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [NonGenericClass()])
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_167")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [NonGenericClass()])
            @Expect("assertion#5186: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_167")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>()], [NonGenericClass()])
            @Expect("assertion#5187: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_167")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#5188: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_167")[0i64]
                .apply(StandardStructType<Int64, Bool, UInt16>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#5189: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_167")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#5190: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_167")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#5191: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_167")[0i64]
                .apply(StandardStructType<Int64, Bool, UInt16>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#5192: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_167")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#5193: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_167")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5194: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_167")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5195: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_167")[0i64]
                .apply(StandardStructType<Int64, Bool, UInt16>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5196: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_167")[0i64]
                .apply(StandardStructType<Int64, Bool, UInt16>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#5197: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_167")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#5198: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_167")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#5199: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_167")[0i64]
                .apply(StandardStructType<Int64, Bool, UInt16>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#5200: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_167")[0i64]
                .apply(StandardStructType<Int64, Bool, UInt16>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#5201: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_167")[0i64]
                .apply(StandardStructType<Int64, Bool, UInt16>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#5202: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_167")[0i64]
                .apply(StandardStructType<Int64, Bool, UInt16>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5203: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_167")[0i64]
                .apply(StandardStructType<Int64, Bool, UInt16>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#5204: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_167")[0i64]
                .apply(StandardStructType<Int64, Bool, UInt16>(), [NonGenericClass()])
            @Expect("assertion#5205: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_167")[0i64]
                .apply(1i64, [NonGenericClass()])
            @Expect("assertion#5206: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_167")[0i64]
                .apply("hello", [NonGenericClass()])
            @Expect("assertion#5207: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_167")[0i64]
                .apply(StandardStructType<Int64, Bool, UInt16>(), [])
            @Expect("assertion#5208: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_167")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5209: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_167")[0i64]
                .apply("hello", [])
            @Expect("assertion#5210: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_167")[0i64]
                .apply(StandardStructType<Int64, Bool, UInt16>(), [])
            @Expect("assertion#5211: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_167")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5212: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_167")[0i64]
                .apply("hello", [])
            @Expect("assertion#5213: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_167")[0i64]
                .apply(StandardStructType<Int64, Bool, UInt16>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5214: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_167")[0i64]
                .apply(1i64, [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5215: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_167")[0i64]
                .apply("hello", [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5216: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_167")[0i64]
                .apply(StandardStructType<Int64, Bool, UInt16>(), [()])
            @Expect("assertion#5217: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_167")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#5218: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_167")[0i64]
                .apply("hello", [()])
            @Expect("assertion#5219: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_167(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt64, Int32, Float32>>().getInstanceFunctions("classInstanceMemberFunction_168").size)
        TypeInfo
            .of<StandardStructType<UInt64, Int32, Float32>>()
            .getInstanceFunctions("classInstanceMemberFunction_168")[0i64]
            .apply(StandardStructType<UInt64, Int32, Float32>(),
                [TypeInfo.of<Int8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float32>()], [NonGenericClass()])
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_168")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<Float32>()], [NonGenericClass()])
            @Expect("assertion#5220: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_168")[0i64]
                .apply("hello", [TypeInfo.of<Int8>(), TypeInfo.of<UInt16>()], [NonGenericClass()])
            @Expect("assertion#5221: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_168")[0i64]
                .apply(1i64, [TypeInfo.of<Int8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#5222: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_168")[0i64]
                .apply(StandardStructType<UInt64, Int32, Float32>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#5223: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_168")[0i64]
                .apply("hello",
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#5224: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_168")[0i64]
                .apply("hello", [TypeInfo.of<Int8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#5225: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_168")[0i64]
                .apply(StandardStructType<UInt64, Int32, Float32>(), [TypeInfo.of<Int8>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#5226: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_168")[0i64]
                .apply(1i64, [TypeInfo.of<Int8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#5227: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_168")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<Float32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5228: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_168")[0i64]
                .apply(1i64, [TypeInfo.of<Int8>(), TypeInfo.of<UInt16>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5229: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_168")[0i64]
                .apply(StandardStructType<UInt64, Int32, Float32>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5230: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_168")[0i64]
                .apply(StandardStructType<UInt64, Int32, Float32>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#5231: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_168")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#5232: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_168")[0i64]
                .apply("hello", [TypeInfo.of<Int8>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#5233: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_168")[0i64]
                .apply(StandardStructType<UInt64, Int32, Float32>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#5234: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_168")[0i64]
                .apply(StandardStructType<UInt64, Int32, Float32>(), [TypeInfo.of<Int8>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#5235: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_168")[0i64]
                .apply(StandardStructType<UInt64, Int32, Float32>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#5236: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_168")[0i64]
                .apply(StandardStructType<UInt64, Int32, Float32>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float32>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5237: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_168")[0i64]
                .apply(StandardStructType<UInt64, Int32, Float32>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#5238: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_168")[0i64]
                .apply(StandardStructType<UInt64, Int32, Float32>(), [NonGenericClass()])
            @Expect("assertion#5239: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_168")[0i64]
                .apply(1i64, [NonGenericClass()])
            @Expect("assertion#5240: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_168")[0i64]
                .apply("hello", [NonGenericClass()])
            @Expect("assertion#5241: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_168")[0i64]
                .apply(StandardStructType<UInt64, Int32, Float32>(), [])
            @Expect("assertion#5242: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_168")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5243: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_168")[0i64]
                .apply("hello", [])
            @Expect("assertion#5244: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_168")[0i64]
                .apply(StandardStructType<UInt64, Int32, Float32>(), [])
            @Expect("assertion#5245: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_168")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5246: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_168")[0i64]
                .apply("hello", [])
            @Expect("assertion#5247: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_168")[0i64]
                .apply(StandardStructType<UInt64, Int32, Float32>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5248: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_168")[0i64]
                .apply(1i64, [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5249: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_168")[0i64]
                .apply("hello", [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5250: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_168")[0i64]
                .apply(StandardStructType<UInt64, Int32, Float32>(), [()])
            @Expect("assertion#5251: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_168")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#5252: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_168")[0i64]
                .apply("hello", [()])
            @Expect("assertion#5253: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_168(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<Float64, Int8, Unit>>().getInstanceFunctions("classInstanceMemberFunction_169").size)
        TypeInfo
            .of<StandardStructType<Float64, Int8, Unit>>()
            .getInstanceFunctions("classInstanceMemberFunction_169")[0i64]
            .apply(StandardStructType<Float64, Int8, Unit>(),
                [TypeInfo.of<Int64>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>()], [NonGenericClass()])
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_169")[0i64]
                .apply(1i64, [TypeInfo.of<Int8>(), TypeInfo.of<Float32>()], [NonGenericClass()])
            @Expect("assertion#5254: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_169")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Int8>()], [NonGenericClass()])
            @Expect("assertion#5255: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_169")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#5256: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_169")[0i64]
                .apply(StandardStructType<Float64, Int8, Unit>(), [TypeInfo.of<Int8>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#5257: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_169")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#5258: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_169")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#5259: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_169")[0i64]
                .apply(StandardStructType<Float64, Int8, Unit>(), [TypeInfo.of<Int64>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#5260: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_169")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#5261: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_169")[0i64]
                .apply("hello", [TypeInfo.of<Int8>(), TypeInfo.of<Float32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5262: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_169")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Int8>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5263: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_169")[0i64]
                .apply(StandardStructType<Float64, Int8, Unit>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5264: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_169")[0i64]
                .apply(StandardStructType<Float64, Int8, Unit>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#5265: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_169")[0i64]
                .apply(1i64, [TypeInfo.of<Int8>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#5266: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_169")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#5267: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_169")[0i64]
                .apply(StandardStructType<Float64, Int8, Unit>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#5268: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_169")[0i64]
                .apply(StandardStructType<Float64, Int8, Unit>(), [TypeInfo.of<Int64>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#5269: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_169")[0i64]
                .apply(StandardStructType<Float64, Int8, Unit>(), [TypeInfo.of<Int8>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#5270: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_169")[0i64]
                .apply(StandardStructType<Float64, Int8, Unit>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5271: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_169")[0i64]
                .apply(StandardStructType<Float64, Int8, Unit>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#5272: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_169")[0i64]
                .apply(StandardStructType<Float64, Int8, Unit>(), [NonGenericClass()])
            @Expect("assertion#5273: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_169")[0i64]
                .apply(1i64, [NonGenericClass()])
            @Expect("assertion#5274: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_169")[0i64]
                .apply("hello", [NonGenericClass()])
            @Expect("assertion#5275: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_169")[0i64]
                .apply(StandardStructType<Float64, Int8, Unit>(), [])
            @Expect("assertion#5276: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_169")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5277: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_169")[0i64]
                .apply("hello", [])
            @Expect("assertion#5278: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_169")[0i64]
                .apply(StandardStructType<Float64, Int8, Unit>(), [])
            @Expect("assertion#5279: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_169")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5280: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_169")[0i64]
                .apply("hello", [])
            @Expect("assertion#5281: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_169")[0i64]
                .apply(StandardStructType<Float64, Int8, Unit>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5282: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_169")[0i64]
                .apply(1i64, [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5283: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_169")[0i64]
                .apply("hello", [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5284: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_169")[0i64]
                .apply(StandardStructType<Float64, Int8, Unit>(), [()])
            @Expect("assertion#5285: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_169")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#5286: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_169")[0i64]
                .apply("hello", [()])
            @Expect("assertion#5287: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }
}
