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
class testGetStaticFunctions_StandardClassType_12 {
    @TestCase
    func TestCase_273(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<Int32, Int64, Int8>>().getStaticFunctions("classStaticMemberFunction_56").size)
        TypeInfo
            .of<StandardClassType<Int32, Int64, Int8>>()
            .getStaticFunctions("classStaticMemberFunction_56")[0i64]
            .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int8>>(),
                [TypeInfo.of<Bool>(), TypeInfo.of<Bool>(), TypeInfo.of<Float32>()], [NonGenericClass()])
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_56")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<Float32>()], [NonGenericClass()])
            @Expect("assertion#8099: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int32, Int64, Int8> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_56")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<Bool>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#8100: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int32, Int64, Int8> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_56")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int8>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#8101: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_56")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int8>>(), [TypeInfo.of<Bool>(), TypeInfo.of<Bool>()],
                    [])
            @Expect("assertion#8102: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_56")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Bool>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8103: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int32, Int64, Int8> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_56")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<Bool>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8104: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int32, Int64, Int8> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_56")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int8>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Bool>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8105: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_56")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int8>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Bool>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#8106: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_56")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#8107: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int32, Int64, Int8> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_56")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int8>>(), [TypeInfo.of<Bool>(), TypeInfo.of<Bool>()],
                    [NonGenericClass()])
            @Expect("assertion#8108: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_56")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int8>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Bool>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#8109: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_56")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int8>>(), [TypeInfo.of<Bool>(), TypeInfo.of<Bool>()],
                    [])
            @Expect("assertion#8110: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_56")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int8>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Bool>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8111: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_56")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int8>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Bool>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#8112: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_56")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int8>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#8113: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_56")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int8>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Bool>(), TypeInfo.of<Float32>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8114: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_56")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int8>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Float32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8115: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_56")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int8>>(), [TypeInfo.of<Bool>(), TypeInfo.of<Bool>()],
                    [()])
            @Expect("assertion#8116: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_56")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int8>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Bool>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8117: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_56")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int8>>(), [NonGenericClass()])
            @Expect("assertion#8118: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_56")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass()])
            @Expect("assertion#8119: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_56")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int8>>(), [])
            @Expect("assertion#8120: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_56")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8121: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_56")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int8>>(), [])
            @Expect("assertion#8122: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_56")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8123: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_56")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int8>>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8124: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_56")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8125: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_56")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int8>>(), [()])
            @Expect("assertion#8126: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_56")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#8127: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_274(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt8, Unit, UInt64>>().getStaticFunctions("classStaticMemberFunction_57").size)
        TypeInfo
            .of<StandardClassType<UInt8, Unit, UInt64>>()
            .getStaticFunctions("classStaticMemberFunction_57")[0i64]
            .apply(TypeInfo.of<StandardClassType<UInt8, Unit, UInt64>>(),
                [TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [NonGenericClass()])
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_57")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [NonGenericClass()])
            @Expect("assertion#8128: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, Unit, UInt64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_57")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#8129: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, Unit, UInt64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_57")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, UInt64>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#8130: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_57")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, UInt64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#8131: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_57")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8132: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, Unit, UInt64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_57")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<Int16>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8133: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, Unit, UInt64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_57")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, UInt64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8134: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_57")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, UInt64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#8135: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_57")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#8136: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, Unit, UInt64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_57")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, UInt64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>()], [NonGenericClass()])
            @Expect("assertion#8137: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_57")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, UInt64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#8138: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_57")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, UInt64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#8139: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_57")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, UInt64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8140: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_57")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, UInt64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#8141: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_57")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, UInt64>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#8142: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_57")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, UInt64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<Int64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8143: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_57")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, UInt64>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8144: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_57")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, UInt64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#8145: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_57")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, UInt64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8146: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_57")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, UInt64>>(), [NonGenericClass()])
            @Expect("assertion#8147: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_57")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass()])
            @Expect("assertion#8148: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_57")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, UInt64>>(), [])
            @Expect("assertion#8149: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_57")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8150: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_57")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, UInt64>>(), [])
            @Expect("assertion#8151: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_57")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8152: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_57")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, UInt64>>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8153: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_57")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8154: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_57")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, UInt64>>(), [()])
            @Expect("assertion#8155: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_57")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#8156: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_275(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<Bool, Unit, Int16>>().getStaticFunctions("classStaticMemberFunction_58").size)
        TypeInfo
            .of<StandardClassType<Bool, Unit, Int16>>()
            .getStaticFunctions("classStaticMemberFunction_58")[0i64]
            .apply(TypeInfo.of<StandardClassType<Bool, Unit, Int16>>(),
                [TypeInfo.of<UInt16>(), TypeInfo.of<Int16>(), TypeInfo.of<Float32>()], [NonGenericClass()])
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_58")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<Float32>()], [NonGenericClass()])
            @Expect("assertion#8157: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Bool, Unit, Int16> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_58")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Int16>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#8158: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Bool, Unit, Int16> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_58")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Unit, Int16>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#8159: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_58")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Unit, Int16>>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()],
                    [])
            @Expect("assertion#8160: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_58")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8161: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Bool, Unit, Int16> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_58")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8162: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Bool, Unit, Int16> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_58")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Unit, Int16>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8163: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_58")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Unit, Int16>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int16>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#8164: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_58")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#8165: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Bool, Unit, Int16> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_58")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Unit, Int16>>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()],
                    [NonGenericClass()])
            @Expect("assertion#8166: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_58")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Unit, Int16>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#8167: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_58")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Unit, Int16>>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()],
                    [])
            @Expect("assertion#8168: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_58")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Unit, Int16>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8169: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_58")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Unit, Int16>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int16>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#8170: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_58")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Unit, Int16>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#8171: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_58")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Unit, Int16>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int16>(), TypeInfo.of<Float32>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8172: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_58")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Unit, Int16>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Float32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8173: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_58")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Unit, Int16>>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()],
                    [()])
            @Expect("assertion#8174: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_58")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Unit, Int16>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8175: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_58")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Unit, Int16>>(), [NonGenericClass()])
            @Expect("assertion#8176: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_58")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass()])
            @Expect("assertion#8177: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_58")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Unit, Int16>>(), [])
            @Expect("assertion#8178: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_58")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8179: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_58")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Unit, Int16>>(), [])
            @Expect("assertion#8180: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_58")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8181: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_58")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Unit, Int16>>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8182: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_58")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8183: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_58")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Unit, Int16>>(), [()])
            @Expect("assertion#8184: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_58")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#8185: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_276(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<Int32, Int64, Int64>>().getStaticFunctions("classStaticMemberFunction_59").size)
        TypeInfo
            .of<StandardClassType<Int32, Int64, Int64>>()
            .getStaticFunctions("classStaticMemberFunction_59")[0i64]
            .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int64>>(),
                [TypeInfo.of<Float64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [NonGenericClass()])
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_59")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [NonGenericClass()])
            @Expect("assertion#8186: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int32, Int64, Int64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_59")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8187: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int32, Int64, Int64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_59")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int64>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8188: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_59")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#8189: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_59")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8190: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int32, Int64, Int64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_59")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8191: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int32, Int64, Int64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_59")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8192: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_59")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8193: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_59")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8194: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int32, Int64, Int64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_59")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt64>()], [NonGenericClass()])
            @Expect("assertion#8195: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_59")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#8196: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_59")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#8197: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_59")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8198: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_59")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8199: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_59")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int64>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8200: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_59")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8201: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_59")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int64>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8202: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_59")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#8203: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_59")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [()])
            @Expect("assertion#8204: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_59")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int64>>(), [NonGenericClass()])
            @Expect("assertion#8205: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_59")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass()])
            @Expect("assertion#8206: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_59")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int64>>(), [])
            @Expect("assertion#8207: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_59")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8208: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_59")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int64>>(), [])
            @Expect("assertion#8209: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_59")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8210: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_59")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int64>>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8211: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_59")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8212: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_59")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int64>>(), [()])
            @Expect("assertion#8213: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_59")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#8214: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_277(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt32, UInt8, UInt16>>().getStaticFunctions("classStaticMemberFunction_60").size)
        TypeInfo
            .of<StandardClassType<UInt32, UInt8, UInt16>>()
            .getStaticFunctions("classStaticMemberFunction_60")[0i64]
            .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, UInt16>>(),
                [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()], [NonGenericClass()])
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_60")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()], [NonGenericClass()])
            @Expect("assertion#8215: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, UInt8, UInt16> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_60")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#8216: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, UInt8, UInt16> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_60")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, UInt16>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#8217: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_60")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#8218: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_60")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8219: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, UInt8, UInt16> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_60")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8220: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, UInt8, UInt16> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_60")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8221: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_60")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#8222: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_60")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#8223: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, UInt8, UInt16> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_60")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [NonGenericClass()])
            @Expect("assertion#8224: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_60")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#8225: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_60")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#8226: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_60")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8227: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_60")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#8228: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_60")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, UInt16>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#8229: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_60")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8230: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_60")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, UInt16>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8231: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_60")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#8232: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_60")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8233: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_60")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, UInt16>>(), [NonGenericClass()])
            @Expect("assertion#8234: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_60")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass()])
            @Expect("assertion#8235: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_60")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, UInt16>>(), [])
            @Expect("assertion#8236: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_60")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8237: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_60")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, UInt16>>(), [])
            @Expect("assertion#8238: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_60")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8239: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_60")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, UInt16>>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8240: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_60")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8241: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_60")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, UInt16>>(), [()])
            @Expect("assertion#8242: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_60")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#8243: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }
}
