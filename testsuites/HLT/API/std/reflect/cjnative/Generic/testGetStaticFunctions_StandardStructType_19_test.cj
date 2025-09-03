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
class testGetStaticFunctions_StandardStructType_19 {
    @TestCase
    func TestCase_417(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<Int64, Int32, Int64>>().getStaticFunctions("classStaticMemberFunction_200").size)
        TypeInfo
            .of<StandardStructType<Int64, Int32, Int64>>()
            .getStaticFunctions("classStaticMemberFunction_200")[0i64]
            .apply(TypeInfo.of<StandardStructType<Int64, Int32, Int64>>(),
                [TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<Float32>()], [NonGenericStruct()])
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_200")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<Float32>()], [NonGenericStruct()])
            @Expect("assertion#11825: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int64, Int32, Int64> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_200")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#11826: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int64, Int32, Int64> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_200")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int32, Int64>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#11827: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_200")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int32, Int64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#11828: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_200")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11829: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int64, Int32, Int64> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_200")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<Int16>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11830: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int64, Int32, Int64> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_200")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int32, Int64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11831: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_200")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int32, Int64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#11832: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_200")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#11833: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int64, Int32, Int64> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_200")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int32, Int64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>()], [NonGenericStruct()])
            @Expect("assertion#11834: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_200")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int32, Int64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct()])
            @Expect("assertion#11835: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_200")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int32, Int64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#11836: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_200")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int32, Int64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11837: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_200")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int32, Int64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#11838: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_200")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int32, Int64>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#11839: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_200")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int32, Int64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<Float32>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11840: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_200")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int32, Int64>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Float32>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11841: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_200")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int32, Int64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#11842: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_200")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int32, Int64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#11843: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_200")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int32, Int64>>(), [NonGenericStruct()])
            @Expect("assertion#11844: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_200")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct()])
            @Expect("assertion#11845: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_200")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int32, Int64>>(), [])
            @Expect("assertion#11846: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_200")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11847: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_200")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int32, Int64>>(), [])
            @Expect("assertion#11848: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_200")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11849: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_200")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int32, Int64>>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11850: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_200")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11851: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_200")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int32, Int64>>(), [()])
            @Expect("assertion#11852: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_200")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#11853: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_418(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt32, UInt16, Unit>>().getStaticFunctions("classStaticMemberFunction_201").size)
        TypeInfo
            .of<StandardStructType<UInt32, UInt16, Unit>>()
            .getStaticFunctions("classStaticMemberFunction_201")[0i64]
            .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Unit>>(),
                [TypeInfo.of<Int64>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>()],
                [GenericStructWith1TypeParameters<Int64>()])
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_201")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()],
                    [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#11854: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt32, UInt16, Unit> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_201")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#11855: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt32, UInt16, Unit> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_201")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Unit>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#11856: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_201")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Unit>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#11857: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_201")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11858: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt32, UInt16, Unit> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_201")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Int64>()],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#11859: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt32, UInt16, Unit> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_201")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Unit>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#11860: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_201")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Unit>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#11861: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_201")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#11862: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt32, UInt16, Unit> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_201")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Unit>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int64>()], [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#11863: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_201")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Unit>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#11864: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_201")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Unit>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#11865: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_201")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Unit>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11866: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_201")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Unit>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#11867: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_201")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Unit>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#11868: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_201")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Unit>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>()],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#11869: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_201")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Unit>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#11870: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_201")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Unit>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#11871: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_201")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Unit>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#11872: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_201")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Unit>>(),
                    [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#11873: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_201")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#11874: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_201")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Unit>>(), [])
            @Expect("assertion#11875: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_201")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11876: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_201")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Unit>>(), [])
            @Expect("assertion#11877: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_201")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11878: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_201")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Unit>>(),
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#11879: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_201")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#11880: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_201")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Unit>>(), [()])
            @Expect("assertion#11881: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_201")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#11882: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_419(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<Int64, Int64, Float32>>().getStaticFunctions("classStaticMemberFunction_202").size)
        TypeInfo
            .of<StandardStructType<Int64, Int64, Float32>>()
            .getStaticFunctions("classStaticMemberFunction_202")[0i64]
            .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(),
                [TypeInfo.of<Float32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()],
                [GenericStructWith1TypeParameters<Bool>()])
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_202")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#11883: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int64, Int64, Float32> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_202")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#11884: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int64, Int64, Float32> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_202")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#11885: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_202")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#11886: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_202")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11887: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int64, Int64, Float32> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_202")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>(), TypeInfo.of<Int16>()],
                    [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#11888: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int64, Int64, Float32> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_202")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#11889: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_202")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#11890: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_202")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#11891: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int64, Int64, Float32> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_202")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int16>()], [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#11892: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_202")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#11893: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_202")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#11894: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_202")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11895: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_202")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#11896: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_202")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#11897: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_202")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#11898: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_202")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#11899: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_202")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#11900: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_202")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#11901: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_202")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(),
                    [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#11902: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_202")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#11903: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_202")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(), [])
            @Expect("assertion#11904: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_202")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11905: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_202")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(), [])
            @Expect("assertion#11906: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_202")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11907: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_202")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(),
                    [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#11908: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_202")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#11909: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_202")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(), [()])
            @Expect("assertion#11910: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_202")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#11911: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_420(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<Int64, Int16, UInt32>>().getStaticFunctions("classStaticMemberFunction_203").size)
        TypeInfo
            .of<StandardStructType<Int64, Int16, UInt32>>()
            .getStaticFunctions("classStaticMemberFunction_203")[0i64]
            .apply(TypeInfo.of<StandardStructType<Int64, Int16, UInt32>>(),
                [TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Unit>()],
                [GenericStructWith1TypeParameters<Unit>()])
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_203")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Unit>()],
                    [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#11912: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int64, Int16, UInt32> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_203")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#11913: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int64, Int16, UInt32> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_203")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int16, UInt32>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#11914: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_203")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int16, UInt32>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#11915: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_203")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11916: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int64, Int16, UInt32> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_203")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#11917: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int64, Int16, UInt32> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_203")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int16, UInt32>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#11918: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_203")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int16, UInt32>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#11919: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_203")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#11920: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int64, Int16, UInt32> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_203")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int16, UInt32>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>()], [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#11921: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_203")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int16, UInt32>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#11922: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_203")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int16, UInt32>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#11923: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_203")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int16, UInt32>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11924: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_203")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int16, UInt32>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#11925: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_203")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int16, UInt32>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#11926: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_203")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int16, UInt32>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Unit>()],
                    [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#11927: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_203")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int16, UInt32>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Unit>()],
                    [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#11928: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_203")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int16, UInt32>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#11929: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_203")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int16, UInt32>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#11930: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_203")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int16, UInt32>>(),
                    [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#11931: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_203")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#11932: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_203")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int16, UInt32>>(), [])
            @Expect("assertion#11933: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_203")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11934: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_203")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int16, UInt32>>(), [])
            @Expect("assertion#11935: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_203")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11936: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_203")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int16, UInt32>>(),
                    [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#11937: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_203")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#11938: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_203")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int16, UInt32>>(), [()])
            @Expect("assertion#11939: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_203")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#11940: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_421(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt16, UInt32, Float64>>().getStaticFunctions("classStaticMemberFunction_204").size)
        TypeInfo
            .of<StandardStructType<UInt16, UInt32, Float64>>()
            .getStaticFunctions("classStaticMemberFunction_204")[0i64]
            .apply(TypeInfo.of<StandardStructType<UInt16, UInt32, Float64>>(),
                [TypeInfo.of<Int8>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt32>()],
                [GenericStructWith1TypeParameters<UInt16>()])
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_204")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith1TypeParameters<UInt16>()])
            @Expect("assertion#11941: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, UInt32, Float64> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_204")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#11942: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, UInt32, Float64> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_204")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, UInt32, Float64>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#11943: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_204")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, UInt32, Float64>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#11944: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_204")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11945: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, UInt32, Float64> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_204")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int64>()],
                    [GenericStructWith1TypeParameters<UInt16>(), 114.514000f64])
            @Expect("assertion#11946: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, UInt32, Float64> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_204")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, UInt32, Float64>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<UInt16>(), 114.514000f64])
            @Expect("assertion#11947: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_204")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, UInt32, Float64>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#11948: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_204")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#11949: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, UInt32, Float64> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_204")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, UInt32, Float64>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int64>()], [GenericStructWith1TypeParameters<UInt16>()])
            @Expect("assertion#11950: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_204")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, UInt32, Float64>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<UInt16>()])
            @Expect("assertion#11951: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_204")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, UInt32, Float64>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#11952: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_204")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, UInt32, Float64>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11953: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_204")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, UInt32, Float64>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#11954: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_204")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, UInt32, Float64>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#11955: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_204")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, UInt32, Float64>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith1TypeParameters<UInt16>(), 114.514000f64])
            @Expect("assertion#11956: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_204")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, UInt32, Float64>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith1TypeParameters<UInt16>(), 114.514000f64])
            @Expect("assertion#11957: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_204")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, UInt32, Float64>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#11958: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_204")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, UInt32, Float64>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#11959: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_204")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, UInt32, Float64>>(),
                    [GenericStructWith1TypeParameters<UInt16>()])
            @Expect("assertion#11960: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_204")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<UInt16>()])
            @Expect("assertion#11961: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_204")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, UInt32, Float64>>(), [])
            @Expect("assertion#11962: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_204")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11963: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_204")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, UInt32, Float64>>(), [])
            @Expect("assertion#11964: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_204")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11965: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_204")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, UInt32, Float64>>(),
                    [GenericStructWith1TypeParameters<UInt16>(), 114.514000f64])
            @Expect("assertion#11966: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_204")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<UInt16>(), 114.514000f64])
            @Expect("assertion#11967: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_204")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, UInt32, Float64>>(), [()])
            @Expect("assertion#11968: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_204")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#11969: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }
}
