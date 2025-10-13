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
class testGetStaticFunctions_StandardStructType_21 {
    @TestCase
    func TestCase_427(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<Int16, Float64, Unit>>().getStaticFunctions("classStaticMemberFunction_210").size)
        TypeInfo
            .of<StandardStructType<Int16, Float64, Unit>>()
            .getStaticFunctions("classStaticMemberFunction_210")[0i64]
            .apply(TypeInfo.of<StandardStructType<Int16, Float64, Unit>>(),
                [TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()],
                [GenericStructWith2TypeParameters<Int64, Int64>()])
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_210")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#12115: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int16, Float64, Unit> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_210")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#12116: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int16, Float64, Unit> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_210")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Float64, Unit>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#12117: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_210")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Float64, Unit>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#12118: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_210")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#12119: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int16, Float64, Unit> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_210")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#12120: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int16, Float64, Unit> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_210")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Float64, Unit>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#12121: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_210")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Float64, Unit>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#12122: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_210")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#12123: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int16, Float64, Unit> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_210")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Float64, Unit>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#12124: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_210")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Float64, Unit>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#12125: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_210")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Float64, Unit>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#12126: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_210")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Float64, Unit>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#12127: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_210")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Float64, Unit>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#12128: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_210")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Float64, Unit>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#12129: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_210")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Float64, Unit>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#12130: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_210")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Float64, Unit>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#12131: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_210")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Float64, Unit>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#12132: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_210")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Float64, Unit>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#12133: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_210")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Float64, Unit>>(),
                    [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#12134: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_210")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#12135: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_210")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Float64, Unit>>(), [])
            @Expect("assertion#12136: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_210")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#12137: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_210")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Float64, Unit>>(), [])
            @Expect("assertion#12138: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_210")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#12139: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_210")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Float64, Unit>>(),
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#12140: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_210")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#12141: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_210")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Float64, Unit>>(), [()])
            @Expect("assertion#12142: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_210")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#12143: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_428(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt32, UInt64, UInt16>>().getStaticFunctions("classStaticMemberFunction_211").size)
        TypeInfo
            .of<StandardStructType<UInt32, UInt64, UInt16>>()
            .getStaticFunctions("classStaticMemberFunction_211")[0i64]
            .apply(TypeInfo.of<StandardStructType<UInt32, UInt64, UInt16>>(),
                [TypeInfo.of<Int8>(), TypeInfo.of<Int32>(), TypeInfo.of<Bool>()],
                [GenericStructWith2TypeParameters<Bool, Bool>()])
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_211")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<Bool>()],
                    [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#12144: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt32, UInt64, UInt16> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_211")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#12145: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt32, UInt64, UInt16> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_211")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt64, UInt16>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#12146: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_211")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt64, UInt16>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#12147: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_211")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#12148: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt32, UInt64, UInt16> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_211")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int32>()],
                    [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#12149: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt32, UInt64, UInt16> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_211")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt64, UInt16>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#12150: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_211")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt64, UInt16>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int32>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#12151: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_211")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#12152: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt32, UInt64, UInt16> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_211")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt64, UInt16>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int32>()], [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#12153: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_211")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt64, UInt16>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#12154: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_211")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt64, UInt16>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#12155: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_211")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt64, UInt16>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#12156: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_211")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt64, UInt16>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#12157: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_211")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt64, UInt16>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#12158: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_211")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt64, UInt16>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int32>(), TypeInfo.of<Bool>()],
                    [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#12159: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_211")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt64, UInt16>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Bool>()],
                    [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#12160: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_211")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt64, UInt16>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#12161: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_211")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt64, UInt16>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#12162: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_211")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt64, UInt16>>(),
                    [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#12163: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_211")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#12164: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_211")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt64, UInt16>>(), [])
            @Expect("assertion#12165: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_211")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#12166: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_211")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt64, UInt16>>(), [])
            @Expect("assertion#12167: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_211")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#12168: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_211")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt64, UInt16>>(),
                    [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#12169: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_211")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#12170: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_211")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt64, UInt16>>(), [()])
            @Expect("assertion#12171: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_211")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#12172: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_429(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<Int64, Unit, Int8>>().getStaticFunctions("classStaticMemberFunction_212").size)
        TypeInfo
            .of<StandardStructType<Int64, Unit, Int8>>()
            .getStaticFunctions("classStaticMemberFunction_212")[0i64]
            .apply(TypeInfo.of<StandardStructType<Int64, Unit, Int8>>(),
                [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>()],
                [GenericStructWith2TypeParameters<Unit, Unit>()])
        try {
            TypeInfo
                .of<StandardStructType<Int64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_212")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#12173: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int64, Unit, Int8> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_212")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#12174: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int64, Unit, Int8> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_212")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Unit, Int8>>(), [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()],
                    [])
            @Expect("assertion#12175: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_212")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Unit, Int8>>(), [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()],
                    [])
            @Expect("assertion#12176: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_212")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#12177: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int64, Unit, Int8> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_212")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#12178: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int64, Unit, Int8> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_212")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Unit, Int8>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#12179: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_212")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Unit, Int8>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#12180: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_212")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#12181: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int64, Unit, Int8> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_212")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Unit, Int8>>(), [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#12182: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_212")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Unit, Int8>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#12183: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_212")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Unit, Int8>>(), [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()],
                    [])
            @Expect("assertion#12184: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_212")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Unit, Int8>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#12185: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_212")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Unit, Int8>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#12186: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_212")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Unit, Int8>>(), [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()],
                    [])
            @Expect("assertion#12187: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_212")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Unit, Int8>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#12188: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_212")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Unit, Int8>>(), [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#12189: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_212")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Unit, Int8>>(), [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()],
                    [()])
            @Expect("assertion#12190: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_212")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Unit, Int8>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#12191: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_212")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Unit, Int8>>(),
                    [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#12192: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_212")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#12193: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_212")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Unit, Int8>>(), [])
            @Expect("assertion#12194: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_212")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#12195: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_212")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Unit, Int8>>(), [])
            @Expect("assertion#12196: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_212")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#12197: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_212")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Unit, Int8>>(),
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#12198: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_212")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#12199: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_212")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Unit, Int8>>(), [()])
            @Expect("assertion#12200: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_212")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#12201: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_430(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<Unit, Float32, Float32>>().getStaticFunctions("classStaticMemberFunction_213").size)
        TypeInfo
            .of<StandardStructType<Unit, Float32, Float32>>()
            .getStaticFunctions("classStaticMemberFunction_213")[0i64]
            .apply(TypeInfo.of<StandardStructType<Unit, Float32, Float32>>(),
                [TypeInfo.of<UInt64>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()],
                [GenericStructWith2TypeParameters<Unit, Unit>()])
        try {
            TypeInfo
                .of<StandardStructType<Unit, Float32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_213")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#12202: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, Float32, Float32> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, Float32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_213")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#12203: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, Float32, Float32> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, Float32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_213")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Float32, Float32>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#12204: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, Float32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_213")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Float32, Float32>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#12205: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, Float32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_213")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#12206: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, Float32, Float32> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, Float32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_213")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#12207: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, Float32, Float32> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, Float32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_213")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Float32, Float32>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#12208: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, Float32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_213")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Float32, Float32>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#12209: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, Float32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_213")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#12210: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, Float32, Float32> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, Float32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_213")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Float32, Float32>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#12211: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, Float32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_213")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Float32, Float32>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#12212: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, Float32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_213")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Float32, Float32>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#12213: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, Float32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_213")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Float32, Float32>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#12214: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, Float32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_213")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Float32, Float32>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#12215: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, Float32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_213")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Float32, Float32>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#12216: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, Float32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_213")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Float32, Float32>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#12217: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, Float32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_213")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Float32, Float32>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#12218: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, Float32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_213")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Float32, Float32>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#12219: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, Float32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_213")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Float32, Float32>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#12220: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, Float32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_213")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Float32, Float32>>(),
                    [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#12221: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, Float32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_213")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#12222: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, Float32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_213")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Float32, Float32>>(), [])
            @Expect("assertion#12223: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, Float32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_213")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#12224: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, Float32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_213")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Float32, Float32>>(), [])
            @Expect("assertion#12225: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, Float32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_213")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#12226: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, Float32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_213")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Float32, Float32>>(),
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#12227: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, Float32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_213")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#12228: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, Float32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_213")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Float32, Float32>>(), [()])
            @Expect("assertion#12229: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, Float32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_213")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#12230: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_431(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<Bool, Int32, Bool>>().getStaticFunctions("classStaticMemberFunction_214").size)
        TypeInfo
            .of<StandardStructType<Bool, Int32, Bool>>()
            .getStaticFunctions("classStaticMemberFunction_214")[0i64]
            .apply(TypeInfo.of<StandardStructType<Bool, Int32, Bool>>(),
                [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>()],
                [GenericStructWith2TypeParameters<Int32, Int32>()])
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_214")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int16>()],
                    [GenericStructWith2TypeParameters<Int32, Int32>()])
            @Expect("assertion#12231: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, Int32, Bool> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_214")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#12232: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, Int32, Bool> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_214")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int32, Bool>>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int16>()],
                    [])
            @Expect("assertion#12233: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_214")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int32, Bool>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#12234: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_214")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#12235: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, Int32, Bool> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_214")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<Unit>()],
                    [GenericStructWith2TypeParameters<Int32, Int32>(), 114.514000f64])
            @Expect("assertion#12236: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, Int32, Bool> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_214")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int32, Bool>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Int32, Int32>(), 114.514000f64])
            @Expect("assertion#12237: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_214")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int32, Bool>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#12238: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_214")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#12239: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, Int32, Bool> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_214")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int32, Bool>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>()], [GenericStructWith2TypeParameters<Int32, Int32>()])
            @Expect("assertion#12240: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_214")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int32, Bool>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Int32, Int32>()])
            @Expect("assertion#12241: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_214")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int32, Bool>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#12242: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_214")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int32, Bool>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#12243: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_214")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int32, Bool>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#12244: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_214")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int32, Bool>>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int16>()],
                    [])
            @Expect("assertion#12245: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_214")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int32, Bool>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>()],
                    [GenericStructWith2TypeParameters<Int32, Int32>(), 114.514000f64])
            @Expect("assertion#12246: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_214")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int32, Bool>>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int16>()],
                    [GenericStructWith2TypeParameters<Int32, Int32>(), 114.514000f64])
            @Expect("assertion#12247: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_214")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int32, Bool>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#12248: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_214")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int32, Bool>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#12249: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_214")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int32, Bool>>(),
                    [GenericStructWith2TypeParameters<Int32, Int32>()])
            @Expect("assertion#12250: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_214")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Int32, Int32>()])
            @Expect("assertion#12251: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_214")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int32, Bool>>(), [])
            @Expect("assertion#12252: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_214")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#12253: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_214")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int32, Bool>>(), [])
            @Expect("assertion#12254: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_214")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#12255: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_214")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int32, Bool>>(),
                    [GenericStructWith2TypeParameters<Int32, Int32>(), 114.514000f64])
            @Expect("assertion#12256: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_214")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Int32, Int32>(), 114.514000f64])
            @Expect("assertion#12257: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_214")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int32, Bool>>(), [()])
            @Expect("assertion#12258: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_214")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#12259: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }
}
