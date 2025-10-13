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
class testGetStaticFunctions_StandardClassType_17 {
    @TestCase
    func TestCase_298(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<Float32, UInt16, Float32>>().getStaticFunctions("classStaticMemberFunction_81").size)
        TypeInfo
            .of<StandardClassType<Float32, UInt16, Float32>>()
            .getStaticFunctions("classStaticMemberFunction_81")[0i64]
            .apply(TypeInfo.of<StandardClassType<Float32, UInt16, Float32>>(),
                [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>()],
                [GenericClassWith2TypeParameters<Int64, Int64>()])
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_81")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#8824: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float32, UInt16, Float32> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_81")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#8825: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float32, UInt16, Float32> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_81")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt16, Float32>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#8826: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_81")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt16, Float32>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#8827: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_81")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8828: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float32, UInt16, Float32> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_81")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#8829: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float32, UInt16, Float32> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_81")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt16, Float32>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#8830: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_81")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt16, Float32>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#8831: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_81")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#8832: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float32, UInt16, Float32> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_81")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt16, Float32>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()], [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#8833: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_81")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt16, Float32>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#8834: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_81")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt16, Float32>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#8835: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_81")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt16, Float32>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8836: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_81")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt16, Float32>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#8837: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_81")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt16, Float32>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#8838: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_81")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt16, Float32>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#8839: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_81")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt16, Float32>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#8840: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_81")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt16, Float32>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#8841: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_81")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt16, Float32>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8842: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_81")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt16, Float32>>(),
                    [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#8843: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_81")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#8844: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_81")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt16, Float32>>(), [])
            @Expect("assertion#8845: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_81")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8846: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_81")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt16, Float32>>(), [])
            @Expect("assertion#8847: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_81")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8848: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_81")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt16, Float32>>(),
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#8849: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_81")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#8850: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_81")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt16, Float32>>(), [()])
            @Expect("assertion#8851: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_81")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#8852: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_299(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt8, Int32, Float64>>().getStaticFunctions("classStaticMemberFunction_82").size)
        TypeInfo
            .of<StandardClassType<UInt8, Int32, Float64>>()
            .getStaticFunctions("classStaticMemberFunction_82")[0i64]
            .apply(TypeInfo.of<StandardClassType<UInt8, Int32, Float64>>(),
                [TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()],
                [GenericClassWith2TypeParameters<Unit, Unit>()])
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_82")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#8853: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, Int32, Float64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_82")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#8854: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, Int32, Float64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_82")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int32, Float64>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#8855: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_82")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int32, Float64>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#8856: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_82")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8857: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, Int32, Float64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_82")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#8858: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, Int32, Float64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_82")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int32, Float64>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#8859: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_82")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int32, Float64>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#8860: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_82")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#8861: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, Int32, Float64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_82")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int32, Float64>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>()], [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#8862: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_82")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int32, Float64>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#8863: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_82")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int32, Float64>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#8864: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_82")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int32, Float64>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8865: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_82")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int32, Float64>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#8866: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_82")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int32, Float64>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#8867: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_82")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int32, Float64>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#8868: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_82")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int32, Float64>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#8869: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_82")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int32, Float64>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#8870: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_82")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int32, Float64>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8871: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_82")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int32, Float64>>(),
                    [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#8872: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_82")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#8873: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_82")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int32, Float64>>(), [])
            @Expect("assertion#8874: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_82")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8875: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_82")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int32, Float64>>(), [])
            @Expect("assertion#8876: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_82")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8877: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_82")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int32, Float64>>(),
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#8878: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_82")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#8879: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_82")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int32, Float64>>(), [()])
            @Expect("assertion#8880: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_82")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#8881: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_300(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt64, Int32, Unit>>().getStaticFunctions("classStaticMemberFunction_83").size)
        TypeInfo
            .of<StandardClassType<UInt64, Int32, Unit>>()
            .getStaticFunctions("classStaticMemberFunction_83")[0i64]
            .apply(TypeInfo.of<StandardClassType<UInt64, Int32, Unit>>(),
                [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()], [NonGenericStruct()])
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_83")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()], [NonGenericStruct()])
            @Expect("assertion#8882: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Int32, Unit> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_83")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#8883: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Int32, Unit> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_83")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int32, Unit>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#8884: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_83")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int32, Unit>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#8885: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_83")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8886: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Int32, Unit> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_83")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<Unit>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#8887: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Int32, Unit> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_83")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int32, Unit>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#8888: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_83")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int32, Unit>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#8889: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_83")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#8890: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Int32, Unit> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_83")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int32, Unit>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>()], [NonGenericStruct()])
            @Expect("assertion#8891: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_83")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int32, Unit>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct()])
            @Expect("assertion#8892: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_83")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int32, Unit>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#8893: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_83")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int32, Unit>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8894: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_83")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int32, Unit>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#8895: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_83")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int32, Unit>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#8896: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_83")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int32, Unit>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#8897: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_83")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int32, Unit>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#8898: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_83")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int32, Unit>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#8899: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_83")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int32, Unit>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8900: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_83")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int32, Unit>>(), [NonGenericStruct()])
            @Expect("assertion#8901: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_83")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct()])
            @Expect("assertion#8902: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_83")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int32, Unit>>(), [])
            @Expect("assertion#8903: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_83")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8904: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_83")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int32, Unit>>(), [])
            @Expect("assertion#8905: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_83")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8906: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_83")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int32, Unit>>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#8907: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_83")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#8908: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_83")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int32, Unit>>(), [()])
            @Expect("assertion#8909: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_83")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#8910: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_301(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<Float32, Float64, UInt16>>().getStaticFunctions("classStaticMemberFunction_84").size)
        TypeInfo
            .of<StandardClassType<Float32, Float64, UInt16>>()
            .getStaticFunctions("classStaticMemberFunction_84")[0i64]
            .apply(TypeInfo.of<StandardClassType<Float32, Float64, UInt16>>(),
                [TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int64>()], [NonGenericStruct()])
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_84")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int64>()], [NonGenericStruct()])
            @Expect("assertion#8911: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float32, Float64, UInt16> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_84")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#8912: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float32, Float64, UInt16> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_84")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float64, UInt16>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#8913: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_84")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float64, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#8914: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_84")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8915: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float32, Float64, UInt16> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_84")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Unit>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#8916: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float32, Float64, UInt16> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_84")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float64, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#8917: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_84")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float64, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#8918: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_84")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#8919: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float32, Float64, UInt16> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_84")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float64, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [NonGenericStruct()])
            @Expect("assertion#8920: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_84")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float64, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct()])
            @Expect("assertion#8921: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_84")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float64, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#8922: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_84")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float64, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8923: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_84")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float64, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#8924: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_84")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float64, UInt16>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#8925: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_84")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float64, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#8926: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_84")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float64, UInt16>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int64>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#8927: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_84")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float64, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#8928: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_84")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float64, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8929: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_84")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float64, UInt16>>(), [NonGenericStruct()])
            @Expect("assertion#8930: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_84")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct()])
            @Expect("assertion#8931: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_84")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float64, UInt16>>(), [])
            @Expect("assertion#8932: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_84")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8933: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_84")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float64, UInt16>>(), [])
            @Expect("assertion#8934: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_84")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8935: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_84")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float64, UInt16>>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#8936: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_84")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#8937: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_84")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float64, UInt16>>(), [()])
            @Expect("assertion#8938: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_84")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#8939: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_302(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt8, Int64, UInt8>>().getStaticFunctions("classStaticMemberFunction_85").size)
        TypeInfo
            .of<StandardClassType<UInt8, Int64, UInt8>>()
            .getStaticFunctions("classStaticMemberFunction_85")[0i64]
            .apply(TypeInfo.of<StandardClassType<UInt8, Int64, UInt8>>(),
                [TypeInfo.of<Int32>(), TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [NonGenericStruct()])
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_85")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [NonGenericStruct()])
            @Expect("assertion#8940: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, Int64, UInt8> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_85")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#8941: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, Int64, UInt8> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_85")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int64, UInt8>>(), [TypeInfo.of<Int64>(), TypeInfo.of<Unit>()],
                    [])
            @Expect("assertion#8942: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_85")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int64, UInt8>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#8943: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_85")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8944: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, Int64, UInt8> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_85")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<Int64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#8945: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, Int64, UInt8> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_85")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int64, UInt8>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#8946: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_85")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int64, UInt8>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#8947: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_85")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#8948: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, Int64, UInt8> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_85")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int64, UInt8>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int64>()], [NonGenericStruct()])
            @Expect("assertion#8949: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_85")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int64, UInt8>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct()])
            @Expect("assertion#8950: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_85")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int64, UInt8>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#8951: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_85")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int64, UInt8>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8952: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_85")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int64, UInt8>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#8953: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_85")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int64, UInt8>>(), [TypeInfo.of<Int64>(), TypeInfo.of<Unit>()],
                    [])
            @Expect("assertion#8954: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_85")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int64, UInt8>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int64>(), TypeInfo.of<Unit>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#8955: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_85")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int64, UInt8>>(), [TypeInfo.of<Int64>(), TypeInfo.of<Unit>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#8956: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_85")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int64, UInt8>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#8957: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_85")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int64, UInt8>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8958: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_85")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int64, UInt8>>(), [NonGenericStruct()])
            @Expect("assertion#8959: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_85")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct()])
            @Expect("assertion#8960: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_85")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int64, UInt8>>(), [])
            @Expect("assertion#8961: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_85")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8962: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_85")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int64, UInt8>>(), [])
            @Expect("assertion#8963: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_85")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8964: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_85")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int64, UInt8>>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#8965: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_85")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#8966: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_85")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int64, UInt8>>(), [()])
            @Expect("assertion#8967: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_85")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#8968: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }
}
