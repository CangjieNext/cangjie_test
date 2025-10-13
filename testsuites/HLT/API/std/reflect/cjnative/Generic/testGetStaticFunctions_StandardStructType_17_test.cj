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
class testGetStaticFunctions_StandardStructType_17 {
    @TestCase
    func TestCase_407(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt8, Bool, Float32>>().getStaticFunctions("classStaticMemberFunction_190").size)
        TypeInfo
            .of<StandardStructType<UInt8, Bool, Float32>>()
            .getStaticFunctions("classStaticMemberFunction_190")[0i64]
            .apply(TypeInfo.of<StandardStructType<UInt8, Bool, Float32>>(),
                [TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()],
                [GenericClassWith2TypeParameters<Unit, Unit>()])
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_190")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#11535: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt8, Bool, Float32> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_190")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#11536: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt8, Bool, Float32> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_190")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Bool, Float32>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#11537: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_190")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Bool, Float32>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#11538: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_190")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11539: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt8, Bool, Float32> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_190")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<Unit>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#11540: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt8, Bool, Float32> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_190")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Bool, Float32>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#11541: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_190")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Bool, Float32>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#11542: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_190")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#11543: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt8, Bool, Float32> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_190")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Bool, Float32>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Unit>()], [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#11544: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_190")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Bool, Float32>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#11545: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_190")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Bool, Float32>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#11546: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_190")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Bool, Float32>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11547: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_190")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Bool, Float32>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#11548: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_190")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Bool, Float32>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#11549: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_190")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Bool, Float32>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#11550: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_190")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Bool, Float32>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#11551: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_190")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Bool, Float32>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#11552: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_190")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Bool, Float32>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#11553: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_190")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Bool, Float32>>(),
                    [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#11554: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_190")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#11555: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_190")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Bool, Float32>>(), [])
            @Expect("assertion#11556: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_190")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11557: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_190")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Bool, Float32>>(), [])
            @Expect("assertion#11558: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_190")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11559: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_190")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Bool, Float32>>(),
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#11560: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_190")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#11561: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_190")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Bool, Float32>>(), [()])
            @Expect("assertion#11562: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_190")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#11563: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_408(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<Float64, UInt32, Float64>>().getStaticFunctions("classStaticMemberFunction_191").size)
        TypeInfo
            .of<StandardStructType<Float64, UInt32, Float64>>()
            .getStaticFunctions("classStaticMemberFunction_191")[0i64]
            .apply(TypeInfo.of<StandardStructType<Float64, UInt32, Float64>>(),
                [TypeInfo.of<UInt32>(), TypeInfo.of<Float32>(), TypeInfo.of<Float32>()],
                [GenericClassWith2TypeParameters<Float32, Float32>()])
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_191")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>(), TypeInfo.of<Float32>()],
                    [GenericClassWith2TypeParameters<Float32, Float32>()])
            @Expect("assertion#11564: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, UInt32, Float64> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_191")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Float32>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#11565: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, UInt32, Float64> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_191")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, UInt32, Float64>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#11566: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_191")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, UInt32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#11567: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_191")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Float32>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11568: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, UInt32, Float64> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_191")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Float32>()],
                    [GenericClassWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#11569: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, UInt32, Float64> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_191")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, UInt32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Float32>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#11570: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_191")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, UInt32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Float32>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#11571: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_191")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#11572: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, UInt32, Float64> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_191")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, UInt32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Float32>()],
                    [GenericClassWith2TypeParameters<Float32, Float32>()])
            @Expect("assertion#11573: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_191")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, UInt32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Float32>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Float32, Float32>()])
            @Expect("assertion#11574: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_191")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, UInt32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#11575: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_191")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, UInt32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Float32>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11576: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_191")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, UInt32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Float32>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#11577: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_191")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, UInt32, Float64>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#11578: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_191")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, UInt32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Float32>(), TypeInfo.of<Float32>()],
                    [GenericClassWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#11579: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_191")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, UInt32, Float64>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Float32>()],
                    [GenericClassWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#11580: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_191")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, UInt32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#11581: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_191")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, UInt32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Float32>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [()])
            @Expect("assertion#11582: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_191")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, UInt32, Float64>>(),
                    [GenericClassWith2TypeParameters<Float32, Float32>()])
            @Expect("assertion#11583: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_191")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Float32, Float32>()])
            @Expect("assertion#11584: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_191")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, UInt32, Float64>>(), [])
            @Expect("assertion#11585: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_191")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11586: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_191")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, UInt32, Float64>>(), [])
            @Expect("assertion#11587: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_191")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11588: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_191")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, UInt32, Float64>>(),
                    [GenericClassWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#11589: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_191")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#11590: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_191")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, UInt32, Float64>>(), [()])
            @Expect("assertion#11591: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_191")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#11592: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_409(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<Unit, Int64, UInt16>>().getStaticFunctions("classStaticMemberFunction_192").size)
        TypeInfo
            .of<StandardStructType<Unit, Int64, UInt16>>()
            .getStaticFunctions("classStaticMemberFunction_192")[0i64]
            .apply(TypeInfo.of<StandardStructType<Unit, Int64, UInt16>>(),
                [TypeInfo.of<Bool>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [NonGenericStruct()])
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_192")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [NonGenericStruct()])
            @Expect("assertion#11593: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, Int64, UInt16> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_192")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#11594: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, Int64, UInt16> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_192")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Int64, UInt16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#11595: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_192")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Int64, UInt16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#11596: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_192")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11597: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, Int64, UInt16> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_192")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<UInt8>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11598: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, Int64, UInt16> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_192")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Int64, UInt16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11599: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_192")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Int64, UInt16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#11600: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_192")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#11601: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, Int64, UInt16> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_192")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Int64, UInt16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt8>()], [NonGenericStruct()])
            @Expect("assertion#11602: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_192")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Int64, UInt16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct()])
            @Expect("assertion#11603: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_192")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Int64, UInt16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#11604: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_192")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Int64, UInt16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11605: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_192")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Int64, UInt16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#11606: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_192")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Int64, UInt16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#11607: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_192")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Int64, UInt16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11608: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_192")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Int64, UInt16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11609: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_192")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Int64, UInt16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#11610: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_192")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Int64, UInt16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#11611: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_192")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Int64, UInt16>>(), [NonGenericStruct()])
            @Expect("assertion#11612: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_192")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct()])
            @Expect("assertion#11613: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_192")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Int64, UInt16>>(), [])
            @Expect("assertion#11614: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_192")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11615: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_192")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Int64, UInt16>>(), [])
            @Expect("assertion#11616: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_192")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11617: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_192")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Int64, UInt16>>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11618: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_192")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11619: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_192")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Int64, UInt16>>(), [()])
            @Expect("assertion#11620: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_192")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#11621: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_410(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<Int32, Int8, UInt16>>().getStaticFunctions("classStaticMemberFunction_193").size)
        TypeInfo
            .of<StandardStructType<Int32, Int8, UInt16>>()
            .getStaticFunctions("classStaticMemberFunction_193")[0i64]
            .apply(TypeInfo.of<StandardStructType<Int32, Int8, UInt16>>(),
                [TypeInfo.of<Float32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Bool>()], [NonGenericStruct()])
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_193")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Bool>()], [NonGenericStruct()])
            @Expect("assertion#11622: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int32, Int8, UInt16> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_193")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#11623: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int32, Int8, UInt16> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_193")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int8, UInt16>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#11624: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_193")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int8, UInt16>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#11625: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_193")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11626: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int32, Int8, UInt16> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_193")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>(), TypeInfo.of<UInt16>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11627: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int32, Int8, UInt16> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_193")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int8, UInt16>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11628: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_193")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int8, UInt16>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#11629: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_193")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#11630: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int32, Int8, UInt16> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_193")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int8, UInt16>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt16>()], [NonGenericStruct()])
            @Expect("assertion#11631: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_193")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int8, UInt16>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct()])
            @Expect("assertion#11632: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_193")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int8, UInt16>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#11633: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_193")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int8, UInt16>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11634: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_193")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int8, UInt16>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#11635: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_193")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int8, UInt16>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#11636: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_193")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int8, UInt16>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Bool>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11637: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_193")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int8, UInt16>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Bool>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11638: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_193")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int8, UInt16>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#11639: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_193")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int8, UInt16>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#11640: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_193")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int8, UInt16>>(), [NonGenericStruct()])
            @Expect("assertion#11641: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_193")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct()])
            @Expect("assertion#11642: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_193")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int8, UInt16>>(), [])
            @Expect("assertion#11643: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_193")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11644: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_193")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int8, UInt16>>(), [])
            @Expect("assertion#11645: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_193")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11646: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_193")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int8, UInt16>>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11647: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_193")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11648: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_193")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int8, UInt16>>(), [()])
            @Expect("assertion#11649: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_193")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#11650: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_411(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<Int8, UInt32, Unit>>().getStaticFunctions("classStaticMemberFunction_194").size)
        TypeInfo
            .of<StandardStructType<Int8, UInt32, Unit>>()
            .getStaticFunctions("classStaticMemberFunction_194")[0i64]
            .apply(TypeInfo.of<StandardStructType<Int8, UInt32, Unit>>(),
                [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [NonGenericStruct()])
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_194")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [NonGenericStruct()])
            @Expect("assertion#11651: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int8, UInt32, Unit> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_194")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#11652: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int8, UInt32, Unit> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_194")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt32, Unit>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#11653: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_194")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt32, Unit>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#11654: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_194")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11655: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int8, UInt32, Unit> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_194")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11656: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int8, UInt32, Unit> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_194")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt32, Unit>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11657: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_194")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt32, Unit>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#11658: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_194")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#11659: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int8, UInt32, Unit> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_194")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt32, Unit>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [NonGenericStruct()])
            @Expect("assertion#11660: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_194")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt32, Unit>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct()])
            @Expect("assertion#11661: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_194")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt32, Unit>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#11662: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_194")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt32, Unit>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11663: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_194")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt32, Unit>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#11664: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_194")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt32, Unit>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#11665: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_194")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt32, Unit>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11666: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_194")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt32, Unit>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11667: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_194")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt32, Unit>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#11668: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_194")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt32, Unit>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#11669: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_194")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt32, Unit>>(), [NonGenericStruct()])
            @Expect("assertion#11670: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_194")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct()])
            @Expect("assertion#11671: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_194")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt32, Unit>>(), [])
            @Expect("assertion#11672: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_194")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11673: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_194")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt32, Unit>>(), [])
            @Expect("assertion#11674: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_194")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11675: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_194")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt32, Unit>>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11676: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_194")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11677: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_194")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt32, Unit>>(), [()])
            @Expect("assertion#11678: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_194")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#11679: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }
}
