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
class testGetInstanceFunctions_StandardStructType_18 {
    @TestCase
    func TestCase_194(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<Int16, Int32, Int8>>().getInstanceFunctions("classInstanceMemberFunction_195").size)
        TypeInfo
            .of<StandardStructType<Int16, Int32, Int8>>()
            .getInstanceFunctions("classInstanceMemberFunction_195")[0i64]
            .apply(StandardStructType<Int16, Int32, Int8>(),
                [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()], [NonGenericStruct()])
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_195")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()], [NonGenericStruct()])
            @Expect("assertion#6138: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_195")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [NonGenericStruct()])
            @Expect("assertion#6139: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_195")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#6140: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_195")[0i64]
                .apply(StandardStructType<Int16, Int32, Int8>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#6141: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_195")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#6142: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_195")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#6143: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_195")[0i64]
                .apply(StandardStructType<Int16, Int32, Int8>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#6144: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_195")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#6145: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_195")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6146: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_195")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6147: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_195")[0i64]
                .apply(StandardStructType<Int16, Int32, Int8>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6148: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_195")[0i64]
                .apply(StandardStructType<Int16, Int32, Int8>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#6149: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_195")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#6150: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_195")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#6151: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_195")[0i64]
                .apply(StandardStructType<Int16, Int32, Int8>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct()])
            @Expect("assertion#6152: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_195")[0i64]
                .apply(StandardStructType<Int16, Int32, Int8>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#6153: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_195")[0i64]
                .apply(StandardStructType<Int16, Int32, Int8>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#6154: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_195")[0i64]
                .apply(StandardStructType<Int16, Int32, Int8>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6155: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_195")[0i64]
                .apply(StandardStructType<Int16, Int32, Int8>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#6156: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_195")[0i64]
                .apply(StandardStructType<Int16, Int32, Int8>(), [NonGenericStruct()])
            @Expect("assertion#6157: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_195")[0i64]
                .apply(1i64, [NonGenericStruct()])
            @Expect("assertion#6158: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_195")[0i64]
                .apply("hello", [NonGenericStruct()])
            @Expect("assertion#6159: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_195")[0i64]
                .apply(StandardStructType<Int16, Int32, Int8>(), [])
            @Expect("assertion#6160: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_195")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6161: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_195")[0i64]
                .apply("hello", [])
            @Expect("assertion#6162: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_195")[0i64]
                .apply(StandardStructType<Int16, Int32, Int8>(), [])
            @Expect("assertion#6163: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_195")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6164: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_195")[0i64]
                .apply("hello", [])
            @Expect("assertion#6165: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_195")[0i64]
                .apply(StandardStructType<Int16, Int32, Int8>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6166: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_195")[0i64]
                .apply(1i64, [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6167: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_195")[0i64]
                .apply("hello", [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6168: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_195")[0i64]
                .apply(StandardStructType<Int16, Int32, Int8>(), [()])
            @Expect("assertion#6169: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_195")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#6170: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_195")[0i64]
                .apply("hello", [()])
            @Expect("assertion#6171: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_195(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<Int8, Float64, Float64>>().getInstanceFunctions("classInstanceMemberFunction_196").size)
        TypeInfo
            .of<StandardStructType<Int8, Float64, Float64>>()
            .getInstanceFunctions("classInstanceMemberFunction_196")[0i64]
            .apply(StandardStructType<Int8, Float64, Float64>(),
                [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [NonGenericStruct()])
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_196")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [NonGenericStruct()])
            @Expect("assertion#6172: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_196")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()], [NonGenericStruct()])
            @Expect("assertion#6173: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_196")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#6174: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_196")[0i64]
                .apply(StandardStructType<Int8, Float64, Float64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#6175: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_196")[0i64]
                .apply("hello",
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#6176: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_196")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#6177: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_196")[0i64]
                .apply(StandardStructType<Int8, Float64, Float64>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#6178: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_196")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#6179: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_196")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6180: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_196")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6181: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_196")[0i64]
                .apply(StandardStructType<Int8, Float64, Float64>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6182: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_196")[0i64]
                .apply(StandardStructType<Int8, Float64, Float64>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#6183: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_196")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#6184: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_196")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#6185: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_196")[0i64]
                .apply(StandardStructType<Int8, Float64, Float64>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct()])
            @Expect("assertion#6186: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_196")[0i64]
                .apply(StandardStructType<Int8, Float64, Float64>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#6187: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_196")[0i64]
                .apply(StandardStructType<Int8, Float64, Float64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#6188: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_196")[0i64]
                .apply(StandardStructType<Int8, Float64, Float64>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6189: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_196")[0i64]
                .apply(StandardStructType<Int8, Float64, Float64>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#6190: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_196")[0i64]
                .apply(StandardStructType<Int8, Float64, Float64>(), [NonGenericStruct()])
            @Expect("assertion#6191: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_196")[0i64]
                .apply(1i64, [NonGenericStruct()])
            @Expect("assertion#6192: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_196")[0i64]
                .apply("hello", [NonGenericStruct()])
            @Expect("assertion#6193: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_196")[0i64]
                .apply(StandardStructType<Int8, Float64, Float64>(), [])
            @Expect("assertion#6194: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_196")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6195: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_196")[0i64]
                .apply("hello", [])
            @Expect("assertion#6196: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_196")[0i64]
                .apply(StandardStructType<Int8, Float64, Float64>(), [])
            @Expect("assertion#6197: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_196")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6198: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_196")[0i64]
                .apply("hello", [])
            @Expect("assertion#6199: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_196")[0i64]
                .apply(StandardStructType<Int8, Float64, Float64>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6200: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_196")[0i64]
                .apply(1i64, [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6201: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_196")[0i64]
                .apply("hello", [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6202: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_196")[0i64]
                .apply(StandardStructType<Int8, Float64, Float64>(), [()])
            @Expect("assertion#6203: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_196")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#6204: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_196")[0i64]
                .apply("hello", [()])
            @Expect("assertion#6205: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_196(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt16, Bool, UInt8>>().getInstanceFunctions("classInstanceMemberFunction_197").size)
        TypeInfo
            .of<StandardStructType<UInt16, Bool, UInt8>>()
            .getInstanceFunctions("classInstanceMemberFunction_197")[0i64]
            .apply(StandardStructType<UInt16, Bool, UInt8>(),
                [TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt32>()], [NonGenericStruct()])
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_197")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<UInt32>()], [NonGenericStruct()])
            @Expect("assertion#6206: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_197")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Int32>()], [NonGenericStruct()])
            @Expect("assertion#6207: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_197")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#6208: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_197")[0i64]
                .apply(StandardStructType<UInt16, Bool, UInt8>(), [TypeInfo.of<Int32>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#6209: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_197")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt32>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#6210: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_197")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#6211: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_197")[0i64]
                .apply(StandardStructType<UInt16, Bool, UInt8>(), [TypeInfo.of<Int64>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#6212: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_197")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#6213: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_197")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<UInt32>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6214: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_197")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Int32>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6215: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_197")[0i64]
                .apply(StandardStructType<UInt16, Bool, UInt8>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6216: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_197")[0i64]
                .apply(StandardStructType<UInt16, Bool, UInt8>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#6217: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_197")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#6218: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_197")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#6219: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_197")[0i64]
                .apply(StandardStructType<UInt16, Bool, UInt8>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct()])
            @Expect("assertion#6220: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_197")[0i64]
                .apply(StandardStructType<UInt16, Bool, UInt8>(), [TypeInfo.of<Int64>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#6221: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_197")[0i64]
                .apply(StandardStructType<UInt16, Bool, UInt8>(), [TypeInfo.of<Int32>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#6222: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_197")[0i64]
                .apply(StandardStructType<UInt16, Bool, UInt8>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt32>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6223: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_197")[0i64]
                .apply(StandardStructType<UInt16, Bool, UInt8>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#6224: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_197")[0i64]
                .apply(StandardStructType<UInt16, Bool, UInt8>(), [NonGenericStruct()])
            @Expect("assertion#6225: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_197")[0i64]
                .apply(1i64, [NonGenericStruct()])
            @Expect("assertion#6226: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_197")[0i64]
                .apply("hello", [NonGenericStruct()])
            @Expect("assertion#6227: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_197")[0i64]
                .apply(StandardStructType<UInt16, Bool, UInt8>(), [])
            @Expect("assertion#6228: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_197")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6229: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_197")[0i64]
                .apply("hello", [])
            @Expect("assertion#6230: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_197")[0i64]
                .apply(StandardStructType<UInt16, Bool, UInt8>(), [])
            @Expect("assertion#6231: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_197")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6232: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_197")[0i64]
                .apply("hello", [])
            @Expect("assertion#6233: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_197")[0i64]
                .apply(StandardStructType<UInt16, Bool, UInt8>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6234: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_197")[0i64]
                .apply(1i64, [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6235: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_197")[0i64]
                .apply("hello", [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6236: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_197")[0i64]
                .apply(StandardStructType<UInt16, Bool, UInt8>(), [()])
            @Expect("assertion#6237: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_197")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#6238: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_197")[0i64]
                .apply("hello", [()])
            @Expect("assertion#6239: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_197(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<Int16, Int32, Int8>>().getInstanceFunctions("classInstanceMemberFunction_198").size)
        TypeInfo
            .of<StandardStructType<Int16, Int32, Int8>>()
            .getInstanceFunctions("classInstanceMemberFunction_198")[0i64]
            .apply(StandardStructType<Int16, Int32, Int8>(),
                [TypeInfo.of<Int16>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float32>()], [NonGenericStruct()])
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_198")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<Float32>()], [NonGenericStruct()])
            @Expect("assertion#6240: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_198")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<UInt64>()], [NonGenericStruct()])
            @Expect("assertion#6241: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_198")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#6242: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_198")[0i64]
                .apply(StandardStructType<Int16, Int32, Int8>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#6243: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_198")[0i64]
                .apply("hello",
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#6244: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_198")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#6245: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_198")[0i64]
                .apply(StandardStructType<Int16, Int32, Int8>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#6246: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_198")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float32>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#6247: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_198")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<Float32>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6248: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_198")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<UInt64>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6249: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_198")[0i64]
                .apply(StandardStructType<Int16, Int32, Int8>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6250: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_198")[0i64]
                .apply(StandardStructType<Int16, Int32, Int8>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#6251: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_198")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#6252: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_198")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#6253: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_198")[0i64]
                .apply(StandardStructType<Int16, Int32, Int8>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct()])
            @Expect("assertion#6254: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_198")[0i64]
                .apply(StandardStructType<Int16, Int32, Int8>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#6255: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_198")[0i64]
                .apply(StandardStructType<Int16, Int32, Int8>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#6256: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_198")[0i64]
                .apply(StandardStructType<Int16, Int32, Int8>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float32>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6257: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_198")[0i64]
                .apply(StandardStructType<Int16, Int32, Int8>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#6258: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_198")[0i64]
                .apply(StandardStructType<Int16, Int32, Int8>(), [NonGenericStruct()])
            @Expect("assertion#6259: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_198")[0i64]
                .apply(1i64, [NonGenericStruct()])
            @Expect("assertion#6260: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_198")[0i64]
                .apply("hello", [NonGenericStruct()])
            @Expect("assertion#6261: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_198")[0i64]
                .apply(StandardStructType<Int16, Int32, Int8>(), [])
            @Expect("assertion#6262: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_198")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6263: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_198")[0i64]
                .apply("hello", [])
            @Expect("assertion#6264: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_198")[0i64]
                .apply(StandardStructType<Int16, Int32, Int8>(), [])
            @Expect("assertion#6265: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_198")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6266: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_198")[0i64]
                .apply("hello", [])
            @Expect("assertion#6267: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_198")[0i64]
                .apply(StandardStructType<Int16, Int32, Int8>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6268: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_198")[0i64]
                .apply(1i64, [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6269: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_198")[0i64]
                .apply("hello", [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6270: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_198")[0i64]
                .apply(StandardStructType<Int16, Int32, Int8>(), [()])
            @Expect("assertion#6271: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_198")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#6272: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_198")[0i64]
                .apply("hello", [()])
            @Expect("assertion#6273: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_198(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<Int32, Bool, UInt16>>().getInstanceFunctions("classInstanceMemberFunction_199").size)
        TypeInfo
            .of<StandardStructType<Int32, Bool, UInt16>>()
            .getInstanceFunctions("classInstanceMemberFunction_199")[0i64]
            .apply(StandardStructType<Int32, Bool, UInt16>(),
                [TypeInfo.of<Int32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [NonGenericStruct()])
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_199")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [NonGenericStruct()])
            @Expect("assertion#6274: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_199")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [NonGenericStruct()])
            @Expect("assertion#6275: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_199")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#6276: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_199")[0i64]
                .apply(StandardStructType<Int32, Bool, UInt16>(), [TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#6277: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_199")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int32>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#6278: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_199")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#6279: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_199")[0i64]
                .apply(StandardStructType<Int32, Bool, UInt16>(), [TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#6280: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_199")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#6281: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_199")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6282: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_199")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6283: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_199")[0i64]
                .apply(StandardStructType<Int32, Bool, UInt16>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6284: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_199")[0i64]
                .apply(StandardStructType<Int32, Bool, UInt16>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#6285: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_199")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#6286: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_199")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#6287: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_199")[0i64]
                .apply(StandardStructType<Int32, Bool, UInt16>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct()])
            @Expect("assertion#6288: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_199")[0i64]
                .apply(StandardStructType<Int32, Bool, UInt16>(), [TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#6289: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_199")[0i64]
                .apply(StandardStructType<Int32, Bool, UInt16>(), [TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#6290: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_199")[0i64]
                .apply(StandardStructType<Int32, Bool, UInt16>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int32>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6291: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_199")[0i64]
                .apply(StandardStructType<Int32, Bool, UInt16>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#6292: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_199")[0i64]
                .apply(StandardStructType<Int32, Bool, UInt16>(), [NonGenericStruct()])
            @Expect("assertion#6293: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_199")[0i64]
                .apply(1i64, [NonGenericStruct()])
            @Expect("assertion#6294: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_199")[0i64]
                .apply("hello", [NonGenericStruct()])
            @Expect("assertion#6295: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_199")[0i64]
                .apply(StandardStructType<Int32, Bool, UInt16>(), [])
            @Expect("assertion#6296: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_199")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6297: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_199")[0i64]
                .apply("hello", [])
            @Expect("assertion#6298: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_199")[0i64]
                .apply(StandardStructType<Int32, Bool, UInt16>(), [])
            @Expect("assertion#6299: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_199")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6300: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_199")[0i64]
                .apply("hello", [])
            @Expect("assertion#6301: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_199")[0i64]
                .apply(StandardStructType<Int32, Bool, UInt16>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6302: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_199")[0i64]
                .apply(1i64, [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6303: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_199")[0i64]
                .apply("hello", [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6304: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_199")[0i64]
                .apply(StandardStructType<Int32, Bool, UInt16>(), [()])
            @Expect("assertion#6305: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_199")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#6306: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_199")[0i64]
                .apply("hello", [()])
            @Expect("assertion#6307: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }
}
