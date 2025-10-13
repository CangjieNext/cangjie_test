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
class testGetStaticFunctions_StandardClassType_16 {
    @TestCase
    func TestCase_293(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt8, Unit, Int8>>().getStaticFunctions("classStaticMemberFunction_76").size)
        TypeInfo
            .of<StandardClassType<UInt8, Unit, Int8>>()
            .getStaticFunctions("classStaticMemberFunction_76")[0i64]
            .apply(TypeInfo.of<StandardClassType<UInt8, Unit, Int8>>(),
                [TypeInfo.of<Float32>(), TypeInfo.of<Int64>(), TypeInfo.of<Unit>()],
                [GenericClassWith2TypeParameters<Unit, Unit>()])
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_76")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Unit>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#8679: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, Unit, Int8> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_76")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>(), TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#8680: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, Unit, Int8> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_76")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, Int8>>(), [TypeInfo.of<Int64>(), TypeInfo.of<Unit>()],
                    [])
            @Expect("assertion#8681: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_76")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, Int8>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#8682: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_76")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8683: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, Unit, Int8> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_76")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>(), TypeInfo.of<Int64>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#8684: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, Unit, Int8> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_76")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, Int8>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#8685: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_76")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, Int8>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#8686: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_76")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#8687: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, Unit, Int8> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_76")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, Int8>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int64>()], [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#8688: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_76")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, Int8>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#8689: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_76")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, Int8>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#8690: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_76")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, Int8>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8691: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_76")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, Int8>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#8692: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_76")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, Int8>>(), [TypeInfo.of<Int64>(), TypeInfo.of<Unit>()],
                    [])
            @Expect("assertion#8693: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_76")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, Int8>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int64>(), TypeInfo.of<Unit>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#8694: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_76")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, Int8>>(), [TypeInfo.of<Int64>(), TypeInfo.of<Unit>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#8695: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_76")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, Int8>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#8696: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_76")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, Int8>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8697: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_76")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, Int8>>(),
                    [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#8698: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_76")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#8699: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_76")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, Int8>>(), [])
            @Expect("assertion#8700: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_76")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8701: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_76")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, Int8>>(), [])
            @Expect("assertion#8702: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_76")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8703: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_76")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, Int8>>(),
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#8704: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_76")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#8705: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_76")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, Int8>>(), [()])
            @Expect("assertion#8706: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_76")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#8707: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_294(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<Int16, Float32, UInt32>>().getStaticFunctions("classStaticMemberFunction_77").size)
        TypeInfo
            .of<StandardClassType<Int16, Float32, UInt32>>()
            .getStaticFunctions("classStaticMemberFunction_77")[0i64]
            .apply(TypeInfo.of<StandardClassType<Int16, Float32, UInt32>>(),
                [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()],
                [GenericClassWith2TypeParameters<Int16, Int16>()])
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_77")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()],
                    [GenericClassWith2TypeParameters<Int16, Int16>()])
            @Expect("assertion#8708: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, Float32, UInt32> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_77")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#8709: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, Float32, UInt32> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_77")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Float32, UInt32>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#8710: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_77")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Float32, UInt32>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#8711: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_77")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8712: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, Float32, UInt32> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_77")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>()],
                    [GenericClassWith2TypeParameters<Int16, Int16>(), 114.514000f64])
            @Expect("assertion#8713: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, Float32, UInt32> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_77")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Float32, UInt32>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Int16, Int16>(), 114.514000f64])
            @Expect("assertion#8714: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_77")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Float32, UInt32>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#8715: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_77")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#8716: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, Float32, UInt32> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_77")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Float32, UInt32>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>()], [GenericClassWith2TypeParameters<Int16, Int16>()])
            @Expect("assertion#8717: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_77")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Float32, UInt32>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Int16, Int16>()])
            @Expect("assertion#8718: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_77")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Float32, UInt32>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#8719: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_77")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Float32, UInt32>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8720: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_77")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Float32, UInt32>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#8721: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_77")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Float32, UInt32>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#8722: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_77")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Float32, UInt32>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()],
                    [GenericClassWith2TypeParameters<Int16, Int16>(), 114.514000f64])
            @Expect("assertion#8723: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_77")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Float32, UInt32>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()],
                    [GenericClassWith2TypeParameters<Int16, Int16>(), 114.514000f64])
            @Expect("assertion#8724: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_77")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Float32, UInt32>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#8725: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_77")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Float32, UInt32>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8726: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_77")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Float32, UInt32>>(),
                    [GenericClassWith2TypeParameters<Int16, Int16>()])
            @Expect("assertion#8727: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_77")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Int16, Int16>()])
            @Expect("assertion#8728: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_77")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Float32, UInt32>>(), [])
            @Expect("assertion#8729: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_77")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8730: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_77")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Float32, UInt32>>(), [])
            @Expect("assertion#8731: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_77")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8732: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_77")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Float32, UInt32>>(),
                    [GenericClassWith2TypeParameters<Int16, Int16>(), 114.514000f64])
            @Expect("assertion#8733: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_77")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Int16, Int16>(), 114.514000f64])
            @Expect("assertion#8734: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_77")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Float32, UInt32>>(), [()])
            @Expect("assertion#8735: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_77")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#8736: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_295(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>().getStaticFunctions("classStaticMemberFunction_78").size)
        TypeInfo
            .of<StandardClassType<UInt64, Unit, Int32>>()
            .getStaticFunctions("classStaticMemberFunction_78")[0i64]
            .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(),
                [TypeInfo.of<Int16>(), TypeInfo.of<Unit>(), TypeInfo.of<Bool>()],
                [GenericClassWith2TypeParameters<Unit, Unit>()])
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_78")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<Bool>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#8737: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Unit, Int32> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_78")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<Unit>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#8738: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Unit, Int32> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_78")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(), [TypeInfo.of<Unit>(), TypeInfo.of<Bool>()],
                    [])
            @Expect("assertion#8739: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_78")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(), [TypeInfo.of<Int16>(), TypeInfo.of<Unit>()],
                    [])
            @Expect("assertion#8740: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_78")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Unit>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8741: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Unit, Int32> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_78")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<Unit>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#8742: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Unit, Int32> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_78")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Unit>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#8743: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_78")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Unit>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#8744: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_78")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#8745: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Unit, Int32> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_78")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(), [TypeInfo.of<Int16>(), TypeInfo.of<Unit>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#8746: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_78")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Unit>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#8747: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_78")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(), [TypeInfo.of<Int16>(), TypeInfo.of<Unit>()],
                    [])
            @Expect("assertion#8748: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_78")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Unit>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8749: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_78")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Unit>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#8750: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_78")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(), [TypeInfo.of<Unit>(), TypeInfo.of<Bool>()],
                    [])
            @Expect("assertion#8751: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_78")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Unit>(), TypeInfo.of<Bool>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#8752: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_78")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(), [TypeInfo.of<Unit>(), TypeInfo.of<Bool>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#8753: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_78")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(), [TypeInfo.of<Int16>(), TypeInfo.of<Unit>()],
                    [()])
            @Expect("assertion#8754: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_78")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Unit>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8755: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_78")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(),
                    [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#8756: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_78")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#8757: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_78")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(), [])
            @Expect("assertion#8758: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_78")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8759: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_78")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(), [])
            @Expect("assertion#8760: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_78")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8761: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_78")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(),
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#8762: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_78")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#8763: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_78")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(), [()])
            @Expect("assertion#8764: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_78")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#8765: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_296(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<Int16, Int16, Float32>>().getStaticFunctions("classStaticMemberFunction_79").size)
        TypeInfo
            .of<StandardClassType<Int16, Int16, Float32>>()
            .getStaticFunctions("classStaticMemberFunction_79")[0i64]
            .apply(TypeInfo.of<StandardClassType<Int16, Int16, Float32>>(),
                [TypeInfo.of<Int16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                [GenericClassWith2TypeParameters<Float32, Float32>()])
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_79")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Float32, Float32>()])
            @Expect("assertion#8766: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, Int16, Float32> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_79")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8767: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, Int16, Float32> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_79")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int16, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8768: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_79")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int16, Float32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#8769: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_79")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8770: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, Int16, Float32> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_79")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<Float32>()],
                    [GenericClassWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#8771: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, Int16, Float32> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_79")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int16, Float32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#8772: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_79")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int16, Float32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8773: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_79")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8774: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, Int16, Float32> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_79")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int16, Float32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Float32>()],
                    [GenericClassWith2TypeParameters<Float32, Float32>()])
            @Expect("assertion#8775: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_79")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int16, Float32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Float32, Float32>()])
            @Expect("assertion#8776: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_79")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int16, Float32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#8777: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_79")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int16, Float32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8778: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_79")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int16, Float32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8779: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_79")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int16, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8780: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_79")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int16, Float32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#8781: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_79")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int16, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#8782: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_79")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int16, Float32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#8783: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_79")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int16, Float32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8784: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_79")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int16, Float32>>(),
                    [GenericClassWith2TypeParameters<Float32, Float32>()])
            @Expect("assertion#8785: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_79")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Float32, Float32>()])
            @Expect("assertion#8786: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_79")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int16, Float32>>(), [])
            @Expect("assertion#8787: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_79")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8788: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_79")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int16, Float32>>(), [])
            @Expect("assertion#8789: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_79")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8790: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_79")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int16, Float32>>(),
                    [GenericClassWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#8791: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_79")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#8792: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_79")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int16, Float32>>(), [()])
            @Expect("assertion#8793: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_79")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#8794: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_297(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<Int32, UInt32, Int8>>().getStaticFunctions("classStaticMemberFunction_80").size)
        TypeInfo
            .of<StandardClassType<Int32, UInt32, Int8>>()
            .getStaticFunctions("classStaticMemberFunction_80")[0i64]
            .apply(TypeInfo.of<StandardClassType<Int32, UInt32, Int8>>(),
                [TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<Unit>()],
                [GenericClassWith2TypeParameters<Bool, Bool>()])
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_80")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<Unit>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#8795: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int32, UInt32, Int8> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_80")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#8796: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int32, UInt32, Int8> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_80")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, UInt32, Int8>>(), [TypeInfo.of<Unit>(), TypeInfo.of<Unit>()],
                    [])
            @Expect("assertion#8797: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_80")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, UInt32, Int8>>(), [TypeInfo.of<Bool>(), TypeInfo.of<Unit>()],
                    [])
            @Expect("assertion#8798: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_80")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8799: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int32, UInt32, Int8> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_80")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<Unit>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#8800: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int32, UInt32, Int8> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_80")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, UInt32, Int8>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#8801: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_80")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, UInt32, Int8>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#8802: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_80")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#8803: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int32, UInt32, Int8> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_80")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, UInt32, Int8>>(), [TypeInfo.of<Bool>(), TypeInfo.of<Unit>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#8804: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_80")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, UInt32, Int8>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#8805: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_80")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, UInt32, Int8>>(), [TypeInfo.of<Bool>(), TypeInfo.of<Unit>()],
                    [])
            @Expect("assertion#8806: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_80")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, UInt32, Int8>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8807: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_80")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, UInt32, Int8>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#8808: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_80")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, UInt32, Int8>>(), [TypeInfo.of<Unit>(), TypeInfo.of<Unit>()],
                    [])
            @Expect("assertion#8809: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_80")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, UInt32, Int8>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<Unit>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#8810: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_80")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, UInt32, Int8>>(), [TypeInfo.of<Unit>(), TypeInfo.of<Unit>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#8811: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_80")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, UInt32, Int8>>(), [TypeInfo.of<Bool>(), TypeInfo.of<Unit>()],
                    [()])
            @Expect("assertion#8812: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_80")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, UInt32, Int8>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8813: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_80")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, UInt32, Int8>>(),
                    [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#8814: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_80")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#8815: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_80")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, UInt32, Int8>>(), [])
            @Expect("assertion#8816: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_80")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8817: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_80")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, UInt32, Int8>>(), [])
            @Expect("assertion#8818: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_80")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8819: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_80")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, UInt32, Int8>>(),
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#8820: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_80")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#8821: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_80")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, UInt32, Int8>>(), [()])
            @Expect("assertion#8822: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_80")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#8823: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }
}
