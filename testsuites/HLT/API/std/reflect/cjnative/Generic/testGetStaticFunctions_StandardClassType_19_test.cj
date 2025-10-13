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
class testGetStaticFunctions_StandardClassType_19 {
    @TestCase
    func TestCase_308(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<Int32, Int32, Int32>>().getStaticFunctions("classStaticMemberFunction_91").size)
        TypeInfo
            .of<StandardClassType<Int32, Int32, Int32>>()
            .getStaticFunctions("classStaticMemberFunction_91")[0i64]
            .apply(TypeInfo.of<StandardClassType<Int32, Int32, Int32>>(),
                [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>()], [NonGenericStruct()])
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_91")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int8>()], [NonGenericStruct()])
            @Expect("assertion#9114: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int32, Int32, Int32> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_91")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#9115: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int32, Int32, Int32> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_91")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int32, Int32>>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int8>()],
                    [])
            @Expect("assertion#9116: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_91")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int32, Int32>>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()],
                    [])
            @Expect("assertion#9117: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_91")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9118: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int32, Int32, Int32> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_91")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#9119: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int32, Int32, Int32> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_91")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int32, Int32>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#9120: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_91")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int32, Int32>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#9121: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_91")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#9122: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int32, Int32, Int32> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_91")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int32, Int32>>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()],
                    [NonGenericStruct()])
            @Expect("assertion#9123: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_91")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int32, Int32>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct()])
            @Expect("assertion#9124: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_91")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int32, Int32>>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()],
                    [])
            @Expect("assertion#9125: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_91")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int32, Int32>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9126: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_91")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int32, Int32>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#9127: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_91")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int32, Int32>>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int8>()],
                    [])
            @Expect("assertion#9128: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_91")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int32, Int32>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#9129: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_91")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int32, Int32>>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int8>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#9130: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_91")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int32, Int32>>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()],
                    [()])
            @Expect("assertion#9131: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_91")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int32, Int32>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#9132: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_91")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int32, Int32>>(), [NonGenericStruct()])
            @Expect("assertion#9133: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_91")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct()])
            @Expect("assertion#9134: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_91")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int32, Int32>>(), [])
            @Expect("assertion#9135: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_91")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9136: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_91")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int32, Int32>>(), [])
            @Expect("assertion#9137: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_91")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9138: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_91")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int32, Int32>>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#9139: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_91")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#9140: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_91")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int32, Int32>>(), [()])
            @Expect("assertion#9141: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_91")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#9142: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_309(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>().getStaticFunctions("classStaticMemberFunction_92").size)
        TypeInfo
            .of<StandardClassType<UInt64, Unit, Int32>>()
            .getStaticFunctions("classStaticMemberFunction_92")[0i64]
            .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(),
                [TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int8>()],
                [GenericStructWith1TypeParameters<Int64>()])
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_92")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Int8>()],
                    [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#9143: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Unit, Int32> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_92")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#9144: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Unit, Int32> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_92")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#9145: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_92")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#9146: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_92")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9147: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Unit, Int32> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_92")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>()],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#9148: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Unit, Int32> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_92")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#9149: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_92")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#9150: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_92")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#9151: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Unit, Int32> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_92")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>()], [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#9152: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_92")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#9153: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_92")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#9154: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_92")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9155: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_92")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#9156: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_92")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#9157: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_92")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int8>()],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#9158: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_92")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int8>()],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#9159: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_92")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#9160: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_92")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#9161: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_92")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(),
                    [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#9162: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_92")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#9163: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_92")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(), [])
            @Expect("assertion#9164: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_92")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9165: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_92")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(), [])
            @Expect("assertion#9166: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_92")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9167: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_92")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(),
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#9168: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_92")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#9169: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_92")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(), [()])
            @Expect("assertion#9170: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_92")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#9171: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_310(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>().getStaticFunctions("classStaticMemberFunction_93").size)
        TypeInfo
            .of<StandardClassType<UInt32, UInt8, Float64>>()
            .getStaticFunctions("classStaticMemberFunction_93")[0i64]
            .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>(),
                [TypeInfo.of<UInt8>(), TypeInfo.of<Int16>(), TypeInfo.of<Int64>()],
                [GenericStructWith1TypeParameters<Bool>()])
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_93")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()],
                    [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#9172: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, UInt8, Float64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_93")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#9173: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, UInt8, Float64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_93")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#9174: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_93")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#9175: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_93")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9176: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, UInt8, Float64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_93")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Int16>()],
                    [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#9177: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, UInt8, Float64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_93")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#9178: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_93")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#9179: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_93")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#9180: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, UInt8, Float64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_93")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int16>()], [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#9181: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_93")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#9182: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_93")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#9183: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_93")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9184: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_93")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#9185: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_93")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#9186: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_93")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int16>(), TypeInfo.of<Int64>()],
                    [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#9187: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_93")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()],
                    [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#9188: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_93")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#9189: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_93")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#9190: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_93")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>(),
                    [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#9191: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_93")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#9192: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_93")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>(), [])
            @Expect("assertion#9193: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_93")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9194: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_93")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>(), [])
            @Expect("assertion#9195: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_93")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9196: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_93")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>(),
                    [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#9197: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_93")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#9198: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_93")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>(), [()])
            @Expect("assertion#9199: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_93")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#9200: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_311(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt8, UInt8, UInt64>>().getStaticFunctions("classStaticMemberFunction_94").size)
        TypeInfo
            .of<StandardClassType<UInt8, UInt8, UInt64>>()
            .getStaticFunctions("classStaticMemberFunction_94")[0i64]
            .apply(TypeInfo.of<StandardClassType<UInt8, UInt8, UInt64>>(),
                [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()],
                [GenericStructWith1TypeParameters<Unit>()])
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_94")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()],
                    [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#9201: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, UInt8, UInt64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_94")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#9202: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, UInt8, UInt64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_94")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt8, UInt64>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#9203: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_94")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt8, UInt64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#9204: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_94")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9205: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, UInt8, UInt64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_94")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()],
                    [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#9206: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, UInt8, UInt64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_94")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt8, UInt64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#9207: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_94")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt8, UInt64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#9208: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_94")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#9209: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, UInt8, UInt64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_94")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt8, UInt64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#9210: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_94")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt8, UInt64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#9211: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_94")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt8, UInt64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#9212: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_94")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt8, UInt64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9213: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_94")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt8, UInt64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#9214: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_94")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt8, UInt64>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#9215: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_94")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt8, UInt64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()],
                    [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#9216: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_94")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt8, UInt64>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()],
                    [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#9217: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_94")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt8, UInt64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#9218: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_94")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt8, UInt64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#9219: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_94")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt8, UInt64>>(),
                    [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#9220: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_94")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#9221: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_94")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt8, UInt64>>(), [])
            @Expect("assertion#9222: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_94")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9223: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_94")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt8, UInt64>>(), [])
            @Expect("assertion#9224: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_94")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9225: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_94")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt8, UInt64>>(),
                    [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#9226: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_94")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#9227: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_94")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt8, UInt64>>(), [()])
            @Expect("assertion#9228: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_94")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#9229: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_312(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<Int64, Bool, Bool>>().getStaticFunctions("classStaticMemberFunction_95").size)
        TypeInfo
            .of<StandardClassType<Int64, Bool, Bool>>()
            .getStaticFunctions("classStaticMemberFunction_95")[0i64]
            .apply(TypeInfo.of<StandardClassType<Int64, Bool, Bool>>(),
                [TypeInfo.of<UInt64>(), TypeInfo.of<Int16>(), TypeInfo.of<Bool>()],
                [GenericStructWith1TypeParameters<Int64>()])
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_95")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<Bool>()],
                    [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#9230: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, Bool, Bool> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_95")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Int16>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#9231: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, Bool, Bool> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_95")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Bool, Bool>>(), [TypeInfo.of<Int16>(), TypeInfo.of<Bool>()],
                    [])
            @Expect("assertion#9232: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_95")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Bool, Bool>>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Int16>()],
                    [])
            @Expect("assertion#9233: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_95")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int16>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9234: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, Bool, Bool> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_95")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Int16>()],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#9235: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, Bool, Bool> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_95")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Bool, Bool>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int16>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#9236: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_95")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Bool, Bool>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int16>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#9237: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_95")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#9238: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, Bool, Bool> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_95")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Bool, Bool>>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Int16>()],
                    [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#9239: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_95")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Bool, Bool>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int16>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#9240: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_95")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Bool, Bool>>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Int16>()],
                    [])
            @Expect("assertion#9241: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_95")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Bool, Bool>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int16>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9242: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_95")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Bool, Bool>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int16>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#9243: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_95")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Bool, Bool>>(), [TypeInfo.of<Int16>(), TypeInfo.of<Bool>()],
                    [])
            @Expect("assertion#9244: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_95")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Bool, Bool>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int16>(), TypeInfo.of<Bool>()],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#9245: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_95")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Bool, Bool>>(), [TypeInfo.of<Int16>(), TypeInfo.of<Bool>()],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#9246: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_95")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Bool, Bool>>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Int16>()],
                    [()])
            @Expect("assertion#9247: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_95")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Bool, Bool>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int16>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#9248: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_95")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Bool, Bool>>(), [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#9249: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_95")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#9250: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_95")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Bool, Bool>>(), [])
            @Expect("assertion#9251: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_95")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9252: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_95")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Bool, Bool>>(), [])
            @Expect("assertion#9253: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_95")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9254: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_95")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Bool, Bool>>(),
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#9255: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_95")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#9256: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_95")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Bool, Bool>>(), [()])
            @Expect("assertion#9257: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_95")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#9258: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }
}
