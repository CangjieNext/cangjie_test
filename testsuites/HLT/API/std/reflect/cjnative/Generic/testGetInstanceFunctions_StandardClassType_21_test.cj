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
class testGetInstanceFunctions_StandardClassType_21 {
    @TestCase
    func TestCase_100(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt32, Int32, Int64>>().getInstanceFunctions("classInstanceMemberFunction_101").size)
        TypeInfo
            .of<StandardClassType<UInt32, Int32, Int64>>()
            .getInstanceFunctions("classInstanceMemberFunction_101")[0i64]
            .apply(StandardClassType<UInt32, Int32, Int64>(),
                [TypeInfo.of<Unit>(), TypeInfo.of<Int32>(), TypeInfo.of<Float32>()],
                [GenericStructWith2TypeParameters<Int64, Int64>()])
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_101")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<Float32>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#3171: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_101")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<Int32>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#3172: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_101")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<Int32>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#3173: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_101")[0i64]
                .apply(StandardClassType<UInt32, Int32, Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#3174: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_101")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<Int32>(), TypeInfo.of<Float32>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#3175: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_101")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<Int32>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#3176: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_101")[0i64]
                .apply(StandardClassType<UInt32, Int32, Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#3177: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_101")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<Int32>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#3178: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_101")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<Float32>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#3179: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_101")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<Int32>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#3180: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_101")[0i64]
                .apply(StandardClassType<UInt32, Int32, Int64>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int32>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#3181: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_101")[0i64]
                .apply(StandardClassType<UInt32, Int32, Int64>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int32>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#3182: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_101")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#3183: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_101")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#3184: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_101")[0i64]
                .apply(StandardClassType<UInt32, Int32, Int64>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int32>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#3185: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_101")[0i64]
                .apply(StandardClassType<UInt32, Int32, Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#3186: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_101")[0i64]
                .apply(StandardClassType<UInt32, Int32, Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#3187: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_101")[0i64]
                .apply(StandardClassType<UInt32, Int32, Int64>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int32>(), TypeInfo.of<Float32>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#3188: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_101")[0i64]
                .apply(StandardClassType<UInt32, Int32, Int64>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int32>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#3189: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_101")[0i64]
                .apply(StandardClassType<UInt32, Int32, Int64>(), [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#3190: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_101")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#3191: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_101")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#3192: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_101")[0i64]
                .apply(StandardClassType<UInt32, Int32, Int64>(), [])
            @Expect("assertion#3193: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_101")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3194: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_101")[0i64]
                .apply("hello", [])
            @Expect("assertion#3195: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_101")[0i64]
                .apply(StandardClassType<UInt32, Int32, Int64>(), [])
            @Expect("assertion#3196: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_101")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3197: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_101")[0i64]
                .apply("hello", [])
            @Expect("assertion#3198: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_101")[0i64]
                .apply(StandardClassType<UInt32, Int32, Int64>(),
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#3199: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_101")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#3200: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_101")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#3201: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_101")[0i64]
                .apply(StandardClassType<UInt32, Int32, Int64>(), [()])
            @Expect("assertion#3202: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_101")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#3203: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_101")[0i64]
                .apply("hello", [()])
            @Expect("assertion#3204: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_101(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt8, Int64, Float32>>().getInstanceFunctions("classInstanceMemberFunction_102").size)
        TypeInfo
            .of<StandardClassType<UInt8, Int64, Float32>>()
            .getInstanceFunctions("classInstanceMemberFunction_102")[0i64]
            .apply(StandardClassType<UInt8, Int64, Float32>(),
                [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()],
                [GenericStructWith2TypeParameters<Bool, Bool>()])
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_102")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()],
                    [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#3205: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_102")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#3206: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_102")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#3207: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_102")[0i64]
                .apply(StandardClassType<UInt8, Int64, Float32>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#3208: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_102")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#3209: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_102")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#3210: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_102")[0i64]
                .apply(StandardClassType<UInt8, Int64, Float32>(), [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#3211: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_102")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#3212: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_102")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()],
                    [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#3213: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_102")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#3214: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_102")[0i64]
                .apply(StandardClassType<UInt8, Int64, Float32>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#3215: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_102")[0i64]
                .apply(StandardClassType<UInt8, Int64, Float32>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#3216: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_102")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#3217: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_102")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#3218: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_102")[0i64]
                .apply(StandardClassType<UInt8, Int64, Float32>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#3219: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_102")[0i64]
                .apply(StandardClassType<UInt8, Int64, Float32>(), [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#3220: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_102")[0i64]
                .apply(StandardClassType<UInt8, Int64, Float32>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#3221: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_102")[0i64]
                .apply(StandardClassType<UInt8, Int64, Float32>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()],
                    [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#3222: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_102")[0i64]
                .apply(StandardClassType<UInt8, Int64, Float32>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#3223: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_102")[0i64]
                .apply(StandardClassType<UInt8, Int64, Float32>(), [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#3224: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_102")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#3225: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_102")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#3226: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_102")[0i64]
                .apply(StandardClassType<UInt8, Int64, Float32>(), [])
            @Expect("assertion#3227: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_102")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3228: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_102")[0i64]
                .apply("hello", [])
            @Expect("assertion#3229: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_102")[0i64]
                .apply(StandardClassType<UInt8, Int64, Float32>(), [])
            @Expect("assertion#3230: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_102")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3231: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_102")[0i64]
                .apply("hello", [])
            @Expect("assertion#3232: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_102")[0i64]
                .apply(StandardClassType<UInt8, Int64, Float32>(),
                    [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#3233: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_102")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#3234: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_102")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#3235: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_102")[0i64]
                .apply(StandardClassType<UInt8, Int64, Float32>(), [()])
            @Expect("assertion#3236: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_102")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#3237: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_102")[0i64]
                .apply("hello", [()])
            @Expect("assertion#3238: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_102(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<Int32, Float64, Float64>>().getInstanceFunctions("classInstanceMemberFunction_103").size)
        TypeInfo
            .of<StandardClassType<Int32, Float64, Float64>>()
            .getInstanceFunctions("classInstanceMemberFunction_103")[0i64]
            .apply(StandardClassType<Int32, Float64, Float64>(),
                [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>()],
                [GenericStructWith2TypeParameters<Unit, Unit>()])
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_103")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#3239: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_103")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#3240: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_103")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#3241: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_103")[0i64]
                .apply(StandardClassType<Int32, Float64, Float64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#3242: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_103")[0i64]
                .apply("hello",
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#3243: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_103")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#3244: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_103")[0i64]
                .apply(StandardClassType<Int32, Float64, Float64>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#3245: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_103")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#3246: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_103")[0i64]
                .apply("hello", [TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#3247: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_103")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#3248: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_103")[0i64]
                .apply(StandardClassType<Int32, Float64, Float64>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#3249: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_103")[0i64]
                .apply(StandardClassType<Int32, Float64, Float64>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#3250: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_103")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#3251: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_103")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#3252: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_103")[0i64]
                .apply(StandardClassType<Int32, Float64, Float64>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#3253: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_103")[0i64]
                .apply(StandardClassType<Int32, Float64, Float64>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#3254: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_103")[0i64]
                .apply(StandardClassType<Int32, Float64, Float64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#3255: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_103")[0i64]
                .apply(StandardClassType<Int32, Float64, Float64>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#3256: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_103")[0i64]
                .apply(StandardClassType<Int32, Float64, Float64>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#3257: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_103")[0i64]
                .apply(StandardClassType<Int32, Float64, Float64>(), [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#3258: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_103")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#3259: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_103")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#3260: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_103")[0i64]
                .apply(StandardClassType<Int32, Float64, Float64>(), [])
            @Expect("assertion#3261: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_103")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3262: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_103")[0i64]
                .apply("hello", [])
            @Expect("assertion#3263: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_103")[0i64]
                .apply(StandardClassType<Int32, Float64, Float64>(), [])
            @Expect("assertion#3264: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_103")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3265: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_103")[0i64]
                .apply("hello", [])
            @Expect("assertion#3266: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_103")[0i64]
                .apply(StandardClassType<Int32, Float64, Float64>(),
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#3267: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_103")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#3268: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_103")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#3269: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_103")[0i64]
                .apply(StandardClassType<Int32, Float64, Float64>(), [()])
            @Expect("assertion#3270: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_103")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#3271: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_103")[0i64]
                .apply("hello", [()])
            @Expect("assertion#3272: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_103(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt64, UInt64, UInt64>>().getInstanceFunctions("classInstanceMemberFunction_104").size)
        TypeInfo
            .of<StandardClassType<UInt64, UInt64, UInt64>>()
            .getInstanceFunctions("classInstanceMemberFunction_104")[0i64]
            .apply(StandardClassType<UInt64, UInt64, UInt64>(),
                [TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Unit>()],
                [GenericStructWith2TypeParameters<UInt64, UInt64>()])
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_104")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<Unit>()],
                    [GenericStructWith2TypeParameters<UInt64, UInt64>()])
            @Expect("assertion#3273: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_104")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith2TypeParameters<UInt64, UInt64>()])
            @Expect("assertion#3274: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_104")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#3275: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_104")[0i64]
                .apply(StandardClassType<UInt64, UInt64, UInt64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#3276: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_104")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Unit>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#3277: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_104")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#3278: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_104")[0i64]
                .apply(StandardClassType<UInt64, UInt64, UInt64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#3279: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_104")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#3280: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_104")[0i64]
                .apply("hello", [TypeInfo.of<UInt32>(), TypeInfo.of<Unit>()],
                    [GenericStructWith2TypeParameters<UInt64, UInt64>(), 114.514000f64])
            @Expect("assertion#3281: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_104")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith2TypeParameters<UInt64, UInt64>(), 114.514000f64])
            @Expect("assertion#3282: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_104")[0i64]
                .apply(StandardClassType<UInt64, UInt64, UInt64>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<UInt64, UInt64>(), 114.514000f64])
            @Expect("assertion#3283: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_104")[0i64]
                .apply(StandardClassType<UInt64, UInt64, UInt64>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#3284: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_104")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#3285: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_104")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#3286: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_104")[0i64]
                .apply(StandardClassType<UInt64, UInt64, UInt64>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<UInt64, UInt64>()])
            @Expect("assertion#3287: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_104")[0i64]
                .apply(StandardClassType<UInt64, UInt64, UInt64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#3288: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_104")[0i64]
                .apply(StandardClassType<UInt64, UInt64, UInt64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#3289: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_104")[0i64]
                .apply(StandardClassType<UInt64, UInt64, UInt64>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Unit>()],
                    [GenericStructWith2TypeParameters<UInt64, UInt64>(), 114.514000f64])
            @Expect("assertion#3290: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_104")[0i64]
                .apply(StandardClassType<UInt64, UInt64, UInt64>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#3291: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_104")[0i64]
                .apply(StandardClassType<UInt64, UInt64, UInt64>(), [GenericStructWith2TypeParameters<UInt64, UInt64>()])
            @Expect("assertion#3292: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_104")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<UInt64, UInt64>()])
            @Expect("assertion#3293: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_104")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<UInt64, UInt64>()])
            @Expect("assertion#3294: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_104")[0i64]
                .apply(StandardClassType<UInt64, UInt64, UInt64>(), [])
            @Expect("assertion#3295: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_104")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3296: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_104")[0i64]
                .apply("hello", [])
            @Expect("assertion#3297: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_104")[0i64]
                .apply(StandardClassType<UInt64, UInt64, UInt64>(), [])
            @Expect("assertion#3298: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_104")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3299: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_104")[0i64]
                .apply("hello", [])
            @Expect("assertion#3300: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_104")[0i64]
                .apply(StandardClassType<UInt64, UInt64, UInt64>(),
                    [GenericStructWith2TypeParameters<UInt64, UInt64>(), 114.514000f64])
            @Expect("assertion#3301: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_104")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<UInt64, UInt64>(), 114.514000f64])
            @Expect("assertion#3302: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_104")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<UInt64, UInt64>(), 114.514000f64])
            @Expect("assertion#3303: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_104")[0i64]
                .apply(StandardClassType<UInt64, UInt64, UInt64>(), [()])
            @Expect("assertion#3304: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_104")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#3305: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_104")[0i64]
                .apply("hello", [()])
            @Expect("assertion#3306: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_104(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt8, Int16, Int64>>().getInstanceFunctions("classInstanceMemberFunction_105").size)
        TypeInfo
            .of<StandardClassType<UInt8, Int16, Int64>>()
            .getInstanceFunctions("classInstanceMemberFunction_105")[0i64]
            .apply(StandardClassType<UInt8, Int16, Int64>(),
                [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()],
                [GenericStructWith2TypeParameters<Int16, Int16>()])
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_105")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith2TypeParameters<Int16, Int16>()])
            @Expect("assertion#3307: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_105")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()],
                    [GenericStructWith2TypeParameters<Int16, Int16>()])
            @Expect("assertion#3308: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_105")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#3309: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_105")[0i64]
                .apply(StandardClassType<UInt8, Int16, Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#3310: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_105")[0i64]
                .apply("hello",
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#3311: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_105")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#3312: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_105")[0i64]
                .apply(StandardClassType<UInt8, Int16, Int64>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#3313: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_105")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#3314: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_105")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith2TypeParameters<Int16, Int16>(), 114.514000f64])
            @Expect("assertion#3315: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_105")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()],
                    [GenericStructWith2TypeParameters<Int16, Int16>(), 114.514000f64])
            @Expect("assertion#3316: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_105")[0i64]
                .apply(StandardClassType<UInt8, Int16, Int64>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Int16, Int16>(), 114.514000f64])
            @Expect("assertion#3317: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_105")[0i64]
                .apply(StandardClassType<UInt8, Int16, Int64>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#3318: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_105")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#3319: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_105")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#3320: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_105")[0i64]
                .apply(StandardClassType<UInt8, Int16, Int64>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Int16, Int16>()])
            @Expect("assertion#3321: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_105")[0i64]
                .apply(StandardClassType<UInt8, Int16, Int64>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#3322: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_105")[0i64]
                .apply(StandardClassType<UInt8, Int16, Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#3323: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_105")[0i64]
                .apply(StandardClassType<UInt8, Int16, Int64>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith2TypeParameters<Int16, Int16>(), 114.514000f64])
            @Expect("assertion#3324: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_105")[0i64]
                .apply(StandardClassType<UInt8, Int16, Int64>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#3325: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_105")[0i64]
                .apply(StandardClassType<UInt8, Int16, Int64>(), [GenericStructWith2TypeParameters<Int16, Int16>()])
            @Expect("assertion#3326: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_105")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Int16, Int16>()])
            @Expect("assertion#3327: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_105")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Int16, Int16>()])
            @Expect("assertion#3328: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_105")[0i64]
                .apply(StandardClassType<UInt8, Int16, Int64>(), [])
            @Expect("assertion#3329: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_105")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3330: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_105")[0i64]
                .apply("hello", [])
            @Expect("assertion#3331: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_105")[0i64]
                .apply(StandardClassType<UInt8, Int16, Int64>(), [])
            @Expect("assertion#3332: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_105")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3333: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_105")[0i64]
                .apply("hello", [])
            @Expect("assertion#3334: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_105")[0i64]
                .apply(StandardClassType<UInt8, Int16, Int64>(),
                    [GenericStructWith2TypeParameters<Int16, Int16>(), 114.514000f64])
            @Expect("assertion#3335: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_105")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Int16, Int16>(), 114.514000f64])
            @Expect("assertion#3336: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_105")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Int16, Int16>(), 114.514000f64])
            @Expect("assertion#3337: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_105")[0i64]
                .apply(StandardClassType<UInt8, Int16, Int64>(), [()])
            @Expect("assertion#3338: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_105")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#3339: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_105")[0i64]
                .apply("hello", [()])
            @Expect("assertion#3340: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }
}
