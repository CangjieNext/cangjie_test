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
class testGetInstanceFunctions_StandardClassType_22 {
    @TestCase
    func TestCase_105(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<Bool, Float32, UInt16>>().getInstanceFunctions("classInstanceMemberFunction_106").size)
        TypeInfo
            .of<StandardClassType<Bool, Float32, UInt16>>()
            .getInstanceFunctions("classInstanceMemberFunction_106")[0i64]
            .apply(StandardClassType<Bool, Float32, UInt16>(),
                [TypeInfo.of<UInt32>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt16>()],
                [GenericStructWith2TypeParameters<UInt16, UInt16>()])
        try {
            TypeInfo
                .of<StandardClassType<Bool, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_106")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith2TypeParameters<UInt16, UInt16>()])
            @Expect("assertion#3341: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_106")[0i64]
                .apply("hello", [TypeInfo.of<UInt32>(), TypeInfo.of<Int32>()],
                    [GenericStructWith2TypeParameters<UInt16, UInt16>()])
            @Expect("assertion#3342: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_106")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#3343: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_106")[0i64]
                .apply(StandardClassType<Bool, Float32, UInt16>(), [TypeInfo.of<Int32>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#3344: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_106")[0i64]
                .apply("hello",
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#3345: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_106")[0i64]
                .apply("hello", [TypeInfo.of<UInt32>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#3346: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_106")[0i64]
                .apply(StandardClassType<Bool, Float32, UInt16>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#3347: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_106")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#3348: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_106")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith2TypeParameters<UInt16, UInt16>(), 114.514000f64])
            @Expect("assertion#3349: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_106")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<Int32>()],
                    [GenericStructWith2TypeParameters<UInt16, UInt16>(), 114.514000f64])
            @Expect("assertion#3350: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_106")[0i64]
                .apply(StandardClassType<Bool, Float32, UInt16>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<UInt16, UInt16>(), 114.514000f64])
            @Expect("assertion#3351: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_106")[0i64]
                .apply(StandardClassType<Bool, Float32, UInt16>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#3352: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_106")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#3353: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_106")[0i64]
                .apply("hello", [TypeInfo.of<UInt32>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#3354: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_106")[0i64]
                .apply(StandardClassType<Bool, Float32, UInt16>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<UInt16, UInt16>()])
            @Expect("assertion#3355: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_106")[0i64]
                .apply(StandardClassType<Bool, Float32, UInt16>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#3356: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_106")[0i64]
                .apply(StandardClassType<Bool, Float32, UInt16>(), [TypeInfo.of<Int32>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#3357: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_106")[0i64]
                .apply(StandardClassType<Bool, Float32, UInt16>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith2TypeParameters<UInt16, UInt16>(), 114.514000f64])
            @Expect("assertion#3358: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_106")[0i64]
                .apply(StandardClassType<Bool, Float32, UInt16>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#3359: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_106")[0i64]
                .apply(StandardClassType<Bool, Float32, UInt16>(), [GenericStructWith2TypeParameters<UInt16, UInt16>()])
            @Expect("assertion#3360: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_106")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<UInt16, UInt16>()])
            @Expect("assertion#3361: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_106")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<UInt16, UInt16>()])
            @Expect("assertion#3362: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_106")[0i64]
                .apply(StandardClassType<Bool, Float32, UInt16>(), [])
            @Expect("assertion#3363: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_106")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3364: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_106")[0i64]
                .apply("hello", [])
            @Expect("assertion#3365: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_106")[0i64]
                .apply(StandardClassType<Bool, Float32, UInt16>(), [])
            @Expect("assertion#3366: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_106")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3367: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_106")[0i64]
                .apply("hello", [])
            @Expect("assertion#3368: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_106")[0i64]
                .apply(StandardClassType<Bool, Float32, UInt16>(),
                    [GenericStructWith2TypeParameters<UInt16, UInt16>(), 114.514000f64])
            @Expect("assertion#3369: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_106")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<UInt16, UInt16>(), 114.514000f64])
            @Expect("assertion#3370: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_106")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<UInt16, UInt16>(), 114.514000f64])
            @Expect("assertion#3371: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_106")[0i64]
                .apply(StandardClassType<Bool, Float32, UInt16>(), [()])
            @Expect("assertion#3372: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_106")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#3373: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_106")[0i64]
                .apply("hello", [()])
            @Expect("assertion#3374: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_106(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<Int16, Bool, Float64>>().getInstanceFunctions("classInstanceMemberFunction_107").size)
        TypeInfo
            .of<StandardClassType<Int16, Bool, Float64>>()
            .getInstanceFunctions("classInstanceMemberFunction_107")[0i64]
            .apply(StandardClassType<Int16, Bool, Float64>(),
                [TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()],
                [GenericStructWith2TypeParameters<Unit, Unit>()])
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_107")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#3375: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_107")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<Int64>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#3376: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_107")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#3377: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_107")[0i64]
                .apply(StandardClassType<Int16, Bool, Float64>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#3378: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_107")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#3379: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_107")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#3380: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_107")[0i64]
                .apply(StandardClassType<Int16, Bool, Float64>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#3381: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_107")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#3382: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_107")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#3383: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_107")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<Int64>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#3384: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_107")[0i64]
                .apply(StandardClassType<Int16, Bool, Float64>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#3385: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_107")[0i64]
                .apply(StandardClassType<Int16, Bool, Float64>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#3386: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_107")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#3387: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_107")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#3388: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_107")[0i64]
                .apply(StandardClassType<Int16, Bool, Float64>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#3389: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_107")[0i64]
                .apply(StandardClassType<Int16, Bool, Float64>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#3390: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_107")[0i64]
                .apply(StandardClassType<Int16, Bool, Float64>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#3391: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_107")[0i64]
                .apply(StandardClassType<Int16, Bool, Float64>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#3392: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_107")[0i64]
                .apply(StandardClassType<Int16, Bool, Float64>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#3393: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_107")[0i64]
                .apply(StandardClassType<Int16, Bool, Float64>(), [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#3394: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_107")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#3395: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_107")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#3396: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_107")[0i64]
                .apply(StandardClassType<Int16, Bool, Float64>(), [])
            @Expect("assertion#3397: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_107")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3398: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_107")[0i64]
                .apply("hello", [])
            @Expect("assertion#3399: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_107")[0i64]
                .apply(StandardClassType<Int16, Bool, Float64>(), [])
            @Expect("assertion#3400: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_107")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3401: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_107")[0i64]
                .apply("hello", [])
            @Expect("assertion#3402: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_107")[0i64]
                .apply(StandardClassType<Int16, Bool, Float64>(),
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#3403: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_107")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#3404: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_107")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#3405: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_107")[0i64]
                .apply(StandardClassType<Int16, Bool, Float64>(), [()])
            @Expect("assertion#3406: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_107")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#3407: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_107")[0i64]
                .apply("hello", [()])
            @Expect("assertion#3408: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_107(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<Bool, UInt64, UInt64>>().getInstanceFunctions("classInstanceMemberFunction_108").size)
        TypeInfo
            .of<StandardClassType<Bool, UInt64, UInt64>>()
            .getInstanceFunctions("classInstanceMemberFunction_108")[0i64]
            .apply(StandardClassType<Bool, UInt64, UInt64>(),
                [TypeInfo.of<Float64>(), TypeInfo.of<Float32>(), TypeInfo.of<Int64>()],
                [GenericStructWith2TypeParameters<Float32, Float32>()])
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_108")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<Int64>()],
                    [GenericStructWith2TypeParameters<Float32, Float32>()])
            @Expect("assertion#3409: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_108")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<Float32>()],
                    [GenericStructWith2TypeParameters<Float32, Float32>()])
            @Expect("assertion#3410: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_108")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<Float32>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#3411: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_108")[0i64]
                .apply(StandardClassType<Bool, UInt64, UInt64>(), [TypeInfo.of<Float32>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#3412: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_108")[0i64]
                .apply("hello",
                    [TypeInfo.of<Float64>(), TypeInfo.of<Float32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#3413: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_108")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<Float32>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#3414: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_108")[0i64]
                .apply(StandardClassType<Bool, UInt64, UInt64>(), [TypeInfo.of<Float64>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#3415: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_108")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<Float32>(), TypeInfo.of<Int64>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#3416: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_108")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<Int64>()],
                    [GenericStructWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#3417: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_108")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<Float32>()],
                    [GenericStructWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#3418: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_108")[0i64]
                .apply(StandardClassType<Bool, UInt64, UInt64>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Float32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#3419: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_108")[0i64]
                .apply(StandardClassType<Bool, UInt64, UInt64>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Float32>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#3420: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_108")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#3421: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_108")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#3422: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_108")[0i64]
                .apply(StandardClassType<Bool, UInt64, UInt64>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Float32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Float32, Float32>()])
            @Expect("assertion#3423: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_108")[0i64]
                .apply(StandardClassType<Bool, UInt64, UInt64>(), [TypeInfo.of<Float64>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#3424: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_108")[0i64]
                .apply(StandardClassType<Bool, UInt64, UInt64>(), [TypeInfo.of<Float32>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#3425: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_108")[0i64]
                .apply(StandardClassType<Bool, UInt64, UInt64>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Float32>(), TypeInfo.of<Int64>()],
                    [GenericStructWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#3426: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_108")[0i64]
                .apply(StandardClassType<Bool, UInt64, UInt64>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Float32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#3427: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_108")[0i64]
                .apply(StandardClassType<Bool, UInt64, UInt64>(), [GenericStructWith2TypeParameters<Float32, Float32>()])
            @Expect("assertion#3428: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_108")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Float32, Float32>()])
            @Expect("assertion#3429: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_108")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Float32, Float32>()])
            @Expect("assertion#3430: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_108")[0i64]
                .apply(StandardClassType<Bool, UInt64, UInt64>(), [])
            @Expect("assertion#3431: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_108")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3432: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_108")[0i64]
                .apply("hello", [])
            @Expect("assertion#3433: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_108")[0i64]
                .apply(StandardClassType<Bool, UInt64, UInt64>(), [])
            @Expect("assertion#3434: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_108")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3435: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_108")[0i64]
                .apply("hello", [])
            @Expect("assertion#3436: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_108")[0i64]
                .apply(StandardClassType<Bool, UInt64, UInt64>(),
                    [GenericStructWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#3437: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_108")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#3438: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_108")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#3439: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_108")[0i64]
                .apply(StandardClassType<Bool, UInt64, UInt64>(), [()])
            @Expect("assertion#3440: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_108")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#3441: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_108")[0i64]
                .apply("hello", [()])
            @Expect("assertion#3442: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_108(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt32, UInt64, UInt32>>().getInstanceFunctions("classInstanceMemberFunction_109").size)
        TypeInfo
            .of<StandardClassType<UInt32, UInt64, UInt32>>()
            .getInstanceFunctions("classInstanceMemberFunction_109")[0i64]
            .apply(StandardClassType<UInt32, UInt64, UInt32>(),
                [TypeInfo.of<Float64>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>()],
                [GenericStructWith2TypeParameters<UInt8, UInt8>()])
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_109")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>()],
                    [GenericStructWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#3443: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_109")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<UInt64>()],
                    [GenericStructWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#3444: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_109")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#3445: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_109")[0i64]
                .apply(StandardClassType<UInt32, UInt64, UInt32>(), [TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#3446: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_109")[0i64]
                .apply("hello",
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#3447: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_109")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#3448: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_109")[0i64]
                .apply(StandardClassType<UInt32, UInt64, UInt32>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#3449: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_109")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#3450: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_109")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>()],
                    [GenericStructWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#3451: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_109")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<UInt64>()],
                    [GenericStructWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#3452: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_109")[0i64]
                .apply(StandardClassType<UInt32, UInt64, UInt32>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#3453: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_109")[0i64]
                .apply(StandardClassType<UInt32, UInt64, UInt32>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#3454: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_109")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#3455: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_109")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#3456: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_109")[0i64]
                .apply(StandardClassType<UInt32, UInt64, UInt32>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#3457: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_109")[0i64]
                .apply(StandardClassType<UInt32, UInt64, UInt32>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#3458: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_109")[0i64]
                .apply(StandardClassType<UInt32, UInt64, UInt32>(), [TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#3459: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_109")[0i64]
                .apply(StandardClassType<UInt32, UInt64, UInt32>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>()],
                    [GenericStructWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#3460: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_109")[0i64]
                .apply(StandardClassType<UInt32, UInt64, UInt32>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#3461: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_109")[0i64]
                .apply(StandardClassType<UInt32, UInt64, UInt32>(), [GenericStructWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#3462: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_109")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#3463: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_109")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#3464: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_109")[0i64]
                .apply(StandardClassType<UInt32, UInt64, UInt32>(), [])
            @Expect("assertion#3465: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_109")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3466: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_109")[0i64]
                .apply("hello", [])
            @Expect("assertion#3467: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_109")[0i64]
                .apply(StandardClassType<UInt32, UInt64, UInt32>(), [])
            @Expect("assertion#3468: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_109")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3469: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_109")[0i64]
                .apply("hello", [])
            @Expect("assertion#3470: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_109")[0i64]
                .apply(StandardClassType<UInt32, UInt64, UInt32>(),
                    [GenericStructWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#3471: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_109")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#3472: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_109")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#3473: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_109")[0i64]
                .apply(StandardClassType<UInt32, UInt64, UInt32>(), [()])
            @Expect("assertion#3474: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_109")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#3475: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_109")[0i64]
                .apply("hello", [()])
            @Expect("assertion#3476: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }
}
