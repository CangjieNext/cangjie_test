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
class testGetStaticFunctions_StandardClassType_15 {
    @TestCase
    func TestCase_288(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt32, UInt32, Int8>>().getStaticFunctions("classStaticMemberFunction_71").size)
        TypeInfo
            .of<StandardClassType<UInt32, UInt32, Int8>>()
            .getStaticFunctions("classStaticMemberFunction_71")[0i64]
            .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, Int8>>(),
                [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>()],
                [GenericClassWith1TypeParameters<Float64>()])
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_71")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>()],
                    [GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#8534: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, UInt32, Int8> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_71")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#8535: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, UInt32, Int8> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_71")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, Int8>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#8536: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_71")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, Int8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#8537: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_71")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8538: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, UInt32, Int8> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_71")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()],
                    [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#8539: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, UInt32, Int8> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_71")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, Int8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#8540: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_71")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, Int8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#8541: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_71")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#8542: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, UInt32, Int8> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_71")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, Int8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#8543: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_71")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, Int8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#8544: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_71")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, Int8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#8545: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_71")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, Int8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8546: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_71")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, Int8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#8547: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_71")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, Int8>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#8548: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_71")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, Int8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>()],
                    [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#8549: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_71")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, Int8>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>()],
                    [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#8550: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_71")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, Int8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#8551: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_71")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, Int8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8552: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_71")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, Int8>>(),
                    [GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#8553: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_71")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#8554: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_71")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, Int8>>(), [])
            @Expect("assertion#8555: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_71")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8556: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_71")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, Int8>>(), [])
            @Expect("assertion#8557: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_71")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8558: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_71")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, Int8>>(),
                    [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#8559: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_71")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#8560: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_71")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, Int8>>(), [()])
            @Expect("assertion#8561: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_71")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#8562: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_289(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<Float64, UInt8, Float32>>().getStaticFunctions("classStaticMemberFunction_72").size)
        TypeInfo
            .of<StandardClassType<Float64, UInt8, Float32>>()
            .getStaticFunctions("classStaticMemberFunction_72")[0i64]
            .apply(TypeInfo.of<StandardClassType<Float64, UInt8, Float32>>(),
                [TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt64>()],
                [GenericClassWith1TypeParameters<Int16>()])
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_72")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt64>()],
                    [GenericClassWith1TypeParameters<Int16>()])
            @Expect("assertion#8563: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float64, UInt8, Float32> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_72")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#8564: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float64, UInt8, Float32> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_72")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt8, Float32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#8565: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_72")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt8, Float32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#8566: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_72")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8567: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float64, UInt8, Float32> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_72")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()],
                    [GenericClassWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#8568: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float64, UInt8, Float32> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_72")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt8, Float32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#8569: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_72")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt8, Float32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#8570: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_72")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#8571: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float64, UInt8, Float32> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_72")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt8, Float32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [GenericClassWith1TypeParameters<Int16>()])
            @Expect("assertion#8572: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_72")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt8, Float32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Int16>()])
            @Expect("assertion#8573: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_72")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt8, Float32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#8574: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_72")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt8, Float32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8575: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_72")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt8, Float32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#8576: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_72")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt8, Float32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#8577: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_72")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt8, Float32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt64>()],
                    [GenericClassWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#8578: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_72")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt8, Float32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt64>()],
                    [GenericClassWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#8579: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_72")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt8, Float32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#8580: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_72")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt8, Float32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8581: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_72")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt8, Float32>>(),
                    [GenericClassWith1TypeParameters<Int16>()])
            @Expect("assertion#8582: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_72")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Int16>()])
            @Expect("assertion#8583: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_72")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt8, Float32>>(), [])
            @Expect("assertion#8584: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_72")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8585: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_72")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt8, Float32>>(), [])
            @Expect("assertion#8586: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_72")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8587: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_72")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt8, Float32>>(),
                    [GenericClassWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#8588: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_72")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#8589: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_72")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt8, Float32>>(), [()])
            @Expect("assertion#8590: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_72")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#8591: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_290(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<Int64, UInt64, Float64>>().getStaticFunctions("classStaticMemberFunction_73").size)
        TypeInfo
            .of<StandardClassType<Int64, UInt64, Float64>>()
            .getStaticFunctions("classStaticMemberFunction_73")[0i64]
            .apply(TypeInfo.of<StandardClassType<Int64, UInt64, Float64>>(),
                [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()],
                [GenericClassWith1TypeParameters<Int8>()])
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt64, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_73")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()],
                    [GenericClassWith1TypeParameters<Int8>()])
            @Expect("assertion#8592: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, UInt64, Float64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt64, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_73")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#8593: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, UInt64, Float64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt64, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_73")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt64, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#8594: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt64, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_73")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt64, Float64>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#8595: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt64, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_73")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8596: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, UInt64, Float64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt64, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_73")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()],
                    [GenericClassWith1TypeParameters<Int8>(), 114.514000f64])
            @Expect("assertion#8597: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, UInt64, Float64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt64, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_73")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt64, Float64>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Int8>(), 114.514000f64])
            @Expect("assertion#8598: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt64, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_73")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt64, Float64>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#8599: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt64, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_73")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#8600: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, UInt64, Float64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt64, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_73")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt64, Float64>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()], [GenericClassWith1TypeParameters<Int8>()])
            @Expect("assertion#8601: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt64, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_73")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt64, Float64>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Int8>()])
            @Expect("assertion#8602: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt64, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_73")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt64, Float64>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#8603: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt64, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_73")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt64, Float64>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8604: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt64, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_73")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt64, Float64>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#8605: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt64, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_73")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt64, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#8606: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt64, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_73")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt64, Float64>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()],
                    [GenericClassWith1TypeParameters<Int8>(), 114.514000f64])
            @Expect("assertion#8607: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt64, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_73")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt64, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()],
                    [GenericClassWith1TypeParameters<Int8>(), 114.514000f64])
            @Expect("assertion#8608: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt64, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_73")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt64, Float64>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#8609: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt64, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_73")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt64, Float64>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8610: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt64, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_73")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt64, Float64>>(),
                    [GenericClassWith1TypeParameters<Int8>()])
            @Expect("assertion#8611: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt64, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_73")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Int8>()])
            @Expect("assertion#8612: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt64, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_73")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt64, Float64>>(), [])
            @Expect("assertion#8613: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt64, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_73")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8614: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt64, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_73")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt64, Float64>>(), [])
            @Expect("assertion#8615: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt64, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_73")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8616: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt64, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_73")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt64, Float64>>(),
                    [GenericClassWith1TypeParameters<Int8>(), 114.514000f64])
            @Expect("assertion#8617: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt64, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_73")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Int8>(), 114.514000f64])
            @Expect("assertion#8618: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt64, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_73")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt64, Float64>>(), [()])
            @Expect("assertion#8619: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt64, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_73")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#8620: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_291(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt32, Unit, UInt8>>().getStaticFunctions("classStaticMemberFunction_74").size)
        TypeInfo
            .of<StandardClassType<UInt32, Unit, UInt8>>()
            .getStaticFunctions("classStaticMemberFunction_74")[0i64]
            .apply(TypeInfo.of<StandardClassType<UInt32, Unit, UInt8>>(),
                [TypeInfo.of<Unit>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()],
                [GenericClassWith2TypeParameters<Int64, Int64>()])
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_74")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#8621: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, Unit, UInt8> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_74")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#8622: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, Unit, UInt8> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_74")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Unit, UInt8>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#8623: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_74")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Unit, UInt8>>(), [TypeInfo.of<Unit>(), TypeInfo.of<Unit>()],
                    [])
            @Expect("assertion#8624: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_74")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8625: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, Unit, UInt8> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_74")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<Unit>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#8626: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, Unit, UInt8> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_74")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Unit, UInt8>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#8627: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_74")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Unit, UInt8>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#8628: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_74")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#8629: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, Unit, UInt8> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_74")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Unit, UInt8>>(), [TypeInfo.of<Unit>(), TypeInfo.of<Unit>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#8630: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_74")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Unit, UInt8>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#8631: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_74")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Unit, UInt8>>(), [TypeInfo.of<Unit>(), TypeInfo.of<Unit>()],
                    [])
            @Expect("assertion#8632: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_74")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Unit, UInt8>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8633: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_74")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Unit, UInt8>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#8634: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_74")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Unit, UInt8>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#8635: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_74")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Unit, UInt8>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#8636: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_74")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Unit, UInt8>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#8637: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_74")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Unit, UInt8>>(), [TypeInfo.of<Unit>(), TypeInfo.of<Unit>()],
                    [()])
            @Expect("assertion#8638: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_74")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Unit, UInt8>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8639: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_74")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Unit, UInt8>>(),
                    [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#8640: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_74")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#8641: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_74")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Unit, UInt8>>(), [])
            @Expect("assertion#8642: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_74")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8643: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_74")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Unit, UInt8>>(), [])
            @Expect("assertion#8644: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_74")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8645: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_74")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Unit, UInt8>>(),
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#8646: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_74")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#8647: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_74")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Unit, UInt8>>(), [()])
            @Expect("assertion#8648: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_74")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#8649: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_292(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt64, Float64, UInt16>>().getStaticFunctions("classStaticMemberFunction_75").size)
        TypeInfo
            .of<StandardClassType<UInt64, Float64, UInt16>>()
            .getStaticFunctions("classStaticMemberFunction_75")[0i64]
            .apply(TypeInfo.of<StandardClassType<UInt64, Float64, UInt16>>(),
                [TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()],
                [GenericClassWith2TypeParameters<Bool, Bool>()])
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_75")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#8650: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Float64, UInt16> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_75")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#8651: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Float64, UInt16> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_75")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Float64, UInt16>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#8652: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_75")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Float64, UInt16>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#8653: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_75")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8654: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Float64, UInt16> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_75")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<Int16>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#8655: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Float64, UInt16> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_75")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Float64, UInt16>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#8656: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_75")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Float64, UInt16>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#8657: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_75")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#8658: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Float64, UInt16> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_75")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Float64, UInt16>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>()], [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#8659: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_75")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Float64, UInt16>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#8660: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_75")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Float64, UInt16>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#8661: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_75")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Float64, UInt16>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8662: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_75")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Float64, UInt16>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#8663: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_75")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Float64, UInt16>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#8664: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_75")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Float64, UInt16>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#8665: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_75")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Float64, UInt16>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#8666: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_75")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Float64, UInt16>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#8667: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_75")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Float64, UInt16>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8668: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_75")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Float64, UInt16>>(),
                    [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#8669: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_75")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#8670: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_75")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Float64, UInt16>>(), [])
            @Expect("assertion#8671: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_75")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8672: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_75")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Float64, UInt16>>(), [])
            @Expect("assertion#8673: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_75")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8674: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_75")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Float64, UInt16>>(),
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#8675: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_75")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#8676: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_75")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Float64, UInt16>>(), [()])
            @Expect("assertion#8677: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_75")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#8678: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }
}
