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
class testGetStaticFunctions_StandardStructType_15 {
    @TestCase
    func TestCase_397(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<Float32, Int8, Float32>>().getStaticFunctions("classStaticMemberFunction_180").size)
        TypeInfo
            .of<StandardStructType<Float32, Int8, Float32>>()
            .getStaticFunctions("classStaticMemberFunction_180")[0i64]
            .apply(TypeInfo.of<StandardStructType<Float32, Int8, Float32>>(),
                [TypeInfo.of<Float32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int64>()],
                [GenericClassWith1TypeParameters<Float32>()])
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_180")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<Int64>()],
                    [GenericClassWith1TypeParameters<Float32>()])
            @Expect("assertion#11245: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float32, Int8, Float32> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_180")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#11246: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float32, Int8, Float32> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_180")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int8, Float32>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#11247: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_180")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int8, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#11248: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_180")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11249: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float32, Int8, Float32> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_180")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>(), TypeInfo.of<Int32>()],
                    [GenericClassWith1TypeParameters<Float32>(), 114.514000f64])
            @Expect("assertion#11250: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float32, Int8, Float32> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_180")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int8, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Float32>(), 114.514000f64])
            @Expect("assertion#11251: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_180")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int8, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#11252: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_180")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#11253: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float32, Int8, Float32> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_180")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int8, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int32>()], [GenericClassWith1TypeParameters<Float32>()])
            @Expect("assertion#11254: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_180")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int8, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Float32>()])
            @Expect("assertion#11255: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_180")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int8, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#11256: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_180")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int8, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11257: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_180")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int8, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#11258: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_180")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int8, Float32>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#11259: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_180")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int8, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int64>()],
                    [GenericClassWith1TypeParameters<Float32>(), 114.514000f64])
            @Expect("assertion#11260: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_180")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int8, Float32>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int64>()],
                    [GenericClassWith1TypeParameters<Float32>(), 114.514000f64])
            @Expect("assertion#11261: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_180")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int8, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#11262: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_180")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int8, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#11263: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_180")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int8, Float32>>(),
                    [GenericClassWith1TypeParameters<Float32>()])
            @Expect("assertion#11264: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_180")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Float32>()])
            @Expect("assertion#11265: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_180")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int8, Float32>>(), [])
            @Expect("assertion#11266: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_180")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11267: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_180")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int8, Float32>>(), [])
            @Expect("assertion#11268: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_180")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11269: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_180")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int8, Float32>>(),
                    [GenericClassWith1TypeParameters<Float32>(), 114.514000f64])
            @Expect("assertion#11270: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_180")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Float32>(), 114.514000f64])
            @Expect("assertion#11271: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_180")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int8, Float32>>(), [()])
            @Expect("assertion#11272: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_180")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#11273: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_398(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt32, UInt16, Int16>>().getStaticFunctions("classStaticMemberFunction_181").size)
        TypeInfo
            .of<StandardStructType<UInt32, UInt16, Int16>>()
            .getStaticFunctions("classStaticMemberFunction_181")[0i64]
            .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Int16>>(),
                [TypeInfo.of<Unit>(), TypeInfo.of<Int16>(), TypeInfo.of<Int16>()],
                [GenericClassWith1TypeParameters<Int16>()])
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_181")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<Int16>()],
                    [GenericClassWith1TypeParameters<Int16>()])
            @Expect("assertion#11274: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt32, UInt16, Int16> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_181")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int16>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#11275: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt32, UInt16, Int16> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_181")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Int16>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#11276: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_181")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Int16>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#11277: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_181")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int16>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11278: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt32, UInt16, Int16> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_181")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int16>()],
                    [GenericClassWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#11279: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt32, UInt16, Int16> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_181")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Int16>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int16>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#11280: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_181")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Int16>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int16>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#11281: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_181")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#11282: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt32, UInt16, Int16> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_181")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Int16>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int16>()], [GenericClassWith1TypeParameters<Int16>()])
            @Expect("assertion#11283: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_181")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Int16>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int16>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Int16>()])
            @Expect("assertion#11284: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_181")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Int16>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#11285: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_181")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Int16>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int16>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11286: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_181")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Int16>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int16>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#11287: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_181")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Int16>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#11288: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_181")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Int16>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int16>(), TypeInfo.of<Int16>()],
                    [GenericClassWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#11289: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_181")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Int16>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int16>()],
                    [GenericClassWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#11290: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_181")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Int16>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#11291: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_181")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Int16>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int16>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#11292: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_181")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Int16>>(),
                    [GenericClassWith1TypeParameters<Int16>()])
            @Expect("assertion#11293: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_181")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Int16>()])
            @Expect("assertion#11294: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_181")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Int16>>(), [])
            @Expect("assertion#11295: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_181")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11296: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_181")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Int16>>(), [])
            @Expect("assertion#11297: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_181")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11298: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_181")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Int16>>(),
                    [GenericClassWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#11299: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_181")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#11300: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_181")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Int16>>(), [()])
            @Expect("assertion#11301: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_181")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#11302: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_399(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<Int32, UInt16, Int8>>().getStaticFunctions("classStaticMemberFunction_182").size)
        TypeInfo
            .of<StandardStructType<Int32, UInt16, Int8>>()
            .getStaticFunctions("classStaticMemberFunction_182")[0i64]
            .apply(TypeInfo.of<StandardStructType<Int32, UInt16, Int8>>(),
                [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()],
                [GenericClassWith1TypeParameters<Int32>()])
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_182")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()],
                    [GenericClassWith1TypeParameters<Int32>()])
            @Expect("assertion#11303: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int32, UInt16, Int8> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_182")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#11304: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int32, UInt16, Int8> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_182")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt16, Int8>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#11305: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_182")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt16, Int8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#11306: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_182")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11307: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int32, UInt16, Int8> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_182")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()],
                    [GenericClassWith1TypeParameters<Int32>(), 114.514000f64])
            @Expect("assertion#11308: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int32, UInt16, Int8> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_182")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt16, Int8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Int32>(), 114.514000f64])
            @Expect("assertion#11309: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_182")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt16, Int8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#11310: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_182")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#11311: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int32, UInt16, Int8> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_182")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt16, Int8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()], [GenericClassWith1TypeParameters<Int32>()])
            @Expect("assertion#11312: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_182")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt16, Int8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Int32>()])
            @Expect("assertion#11313: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_182")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt16, Int8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#11314: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_182")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt16, Int8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11315: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_182")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt16, Int8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#11316: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_182")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt16, Int8>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#11317: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_182")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt16, Int8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()],
                    [GenericClassWith1TypeParameters<Int32>(), 114.514000f64])
            @Expect("assertion#11318: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_182")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt16, Int8>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()],
                    [GenericClassWith1TypeParameters<Int32>(), 114.514000f64])
            @Expect("assertion#11319: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_182")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt16, Int8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#11320: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_182")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt16, Int8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#11321: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_182")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt16, Int8>>(),
                    [GenericClassWith1TypeParameters<Int32>()])
            @Expect("assertion#11322: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_182")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Int32>()])
            @Expect("assertion#11323: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_182")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt16, Int8>>(), [])
            @Expect("assertion#11324: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_182")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11325: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_182")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt16, Int8>>(), [])
            @Expect("assertion#11326: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_182")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11327: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_182")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt16, Int8>>(),
                    [GenericClassWith1TypeParameters<Int32>(), 114.514000f64])
            @Expect("assertion#11328: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_182")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Int32>(), 114.514000f64])
            @Expect("assertion#11329: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_182")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt16, Int8>>(), [()])
            @Expect("assertion#11330: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_182")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#11331: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_400(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<Bool, Int64, Int64>>().getStaticFunctions("classStaticMemberFunction_183").size)
        TypeInfo
            .of<StandardStructType<Bool, Int64, Int64>>()
            .getStaticFunctions("classStaticMemberFunction_183")[0i64]
            .apply(TypeInfo.of<StandardStructType<Bool, Int64, Int64>>(),
                [TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt64>()],
                [GenericClassWith2TypeParameters<Int64, Int64>()])
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_183")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<UInt64>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#11332: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, Int64, Int64> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_183")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#11333: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, Int64, Int64> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_183")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int64, Int64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#11334: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_183")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int64, Int64>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#11335: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_183")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11336: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, Int64, Int64> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_183")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<Int32>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#11337: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, Int64, Int64> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_183")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int64, Int64>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#11338: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_183")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int64, Int64>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#11339: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_183")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#11340: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, Int64, Int64> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_183")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int64, Int64>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int32>()], [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#11341: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_183")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int64, Int64>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#11342: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_183")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int64, Int64>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#11343: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_183")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int64, Int64>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11344: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_183")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int64, Int64>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#11345: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_183")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int64, Int64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#11346: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_183")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int64, Int64>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt64>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#11347: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_183")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int64, Int64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt64>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#11348: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_183")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int64, Int64>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#11349: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_183")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int64, Int64>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#11350: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_183")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int64, Int64>>(),
                    [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#11351: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_183")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#11352: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_183")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int64, Int64>>(), [])
            @Expect("assertion#11353: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_183")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11354: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_183")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int64, Int64>>(), [])
            @Expect("assertion#11355: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_183")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11356: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_183")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int64, Int64>>(),
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#11357: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_183")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#11358: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_183")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int64, Int64>>(), [()])
            @Expect("assertion#11359: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_183")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#11360: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_401(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt64, UInt8, UInt16>>().getStaticFunctions("classStaticMemberFunction_184").size)
        TypeInfo
            .of<StandardStructType<UInt64, UInt8, UInt16>>()
            .getStaticFunctions("classStaticMemberFunction_184")[0i64]
            .apply(TypeInfo.of<StandardStructType<UInt64, UInt8, UInt16>>(),
                [TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt32>()],
                [GenericClassWith2TypeParameters<Bool, Bool>()])
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_184")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt32>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#11361: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, UInt8, UInt16> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_184")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#11362: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, UInt8, UInt16> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_184")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt8, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#11363: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_184")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt8, UInt16>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#11364: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_184")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11365: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, UInt8, UInt16> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_184")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int64>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#11366: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, UInt8, UInt16> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_184")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt8, UInt16>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#11367: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_184")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt8, UInt16>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#11368: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_184")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#11369: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, UInt8, UInt16> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_184")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt8, UInt16>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int64>()], [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#11370: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_184")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt8, UInt16>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#11371: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_184")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt8, UInt16>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#11372: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_184")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt8, UInt16>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11373: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_184")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt8, UInt16>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#11374: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_184")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt8, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#11375: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_184")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt8, UInt16>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt32>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#11376: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_184")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt8, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt32>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#11377: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_184")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt8, UInt16>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#11378: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_184")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt8, UInt16>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#11379: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_184")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt8, UInt16>>(),
                    [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#11380: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_184")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#11381: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_184")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt8, UInt16>>(), [])
            @Expect("assertion#11382: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_184")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11383: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_184")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt8, UInt16>>(), [])
            @Expect("assertion#11384: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_184")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11385: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_184")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt8, UInt16>>(),
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#11386: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_184")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#11387: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_184")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt8, UInt16>>(), [()])
            @Expect("assertion#11388: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_184")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#11389: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }
}
