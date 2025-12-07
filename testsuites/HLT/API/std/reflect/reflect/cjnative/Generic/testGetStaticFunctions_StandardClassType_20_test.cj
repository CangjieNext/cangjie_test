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
class testGetStaticFunctions_StandardClassType_20 {
    @TestCase
    func TestCase_313(): Unit {
        // logger.info("testcase TestCase_313 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int16, Float64, Int64>>().getStaticFunctions("classStaticMemberFunction_96").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int16, Float64, Int64>>()
            .getStaticFunctions("classStaticMemberFunction_96")[0i64]
            .apply(TypeInfo.of<StandardClassType<Int16, Float64, Int64>>(),
                [TypeInfo.of<UInt32>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>()],
                [GenericStructWith1TypeParameters<Float64>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_96")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>()],
                    [GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#9259: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, Float64, Int64> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_96")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#9260: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, Float64, Int64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_96")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Float64, Int64>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#9261: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_96")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Float64, Int64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#9262: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_96")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9263: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, Float64, Int64> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_96")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<UInt8>()],
                    [GenericStructWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#9264: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, Float64, Int64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_96")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Float64, Int64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#9265: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_96")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Float64, Int64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#9266: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_96")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#9267: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, Float64, Int64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_96")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Float64, Int64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt8>()], [GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#9268: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_96")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Float64, Int64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#9269: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_96")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Float64, Int64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#9270: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_96")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Float64, Int64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9271: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_96")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Float64, Int64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#9272: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_96")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Float64, Int64>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#9273: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_96")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Float64, Int64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>()],
                    [GenericStructWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#9274: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_96")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Float64, Int64>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>()],
                    [GenericStructWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#9275: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_96")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Float64, Int64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#9276: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_96")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Float64, Int64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#9277: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_96")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Float64, Int64>>(),
                    [GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#9278: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_96")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#9279: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_96")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Float64, Int64>>(), [])
            @Expect("assertion#9280: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_96")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9281: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_96")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Float64, Int64>>(), [])
            @Expect("assertion#9282: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_96")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9283: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_96")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Float64, Int64>>(),
                    [GenericStructWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#9284: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_96")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#9285: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_96")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Float64, Int64>>(), [()])
            @Expect("assertion#9286: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_96")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#9287: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_313 ends.")
    }

    @TestCase
    func TestCase_314(): Unit {
        // logger.info("testcase TestCase_314 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt64, UInt16, UInt64>>().getStaticFunctions("classStaticMemberFunction_97").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt64, UInt16, UInt64>>()
            .getStaticFunctions("classStaticMemberFunction_97")[0i64]
            .apply(TypeInfo.of<StandardClassType<UInt64, UInt16, UInt64>>(),
                [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()],
                [GenericStructWith1TypeParameters<UInt64>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_97")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()],
                    [GenericStructWith1TypeParameters<UInt64>()])
            @Expect("assertion#9288: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, UInt16, UInt64> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_97")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#9289: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, UInt16, UInt64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_97")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt16, UInt64>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#9290: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_97")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt16, UInt64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#9291: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_97")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9292: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, UInt16, UInt64> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_97")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#9293: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, UInt16, UInt64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_97")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt16, UInt64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#9294: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_97")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt16, UInt64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#9295: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_97")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#9296: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, UInt16, UInt64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_97")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt16, UInt64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()], [GenericStructWith1TypeParameters<UInt64>()])
            @Expect("assertion#9297: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_97")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt16, UInt64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<UInt64>()])
            @Expect("assertion#9298: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_97")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt16, UInt64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#9299: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_97")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt16, UInt64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9300: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_97")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt16, UInt64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#9301: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_97")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt16, UInt64>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#9302: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_97")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt16, UInt64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()],
                    [GenericStructWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#9303: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_97")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt16, UInt64>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()],
                    [GenericStructWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#9304: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_97")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt16, UInt64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#9305: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_97")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt16, UInt64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#9306: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_97")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt16, UInt64>>(),
                    [GenericStructWith1TypeParameters<UInt64>()])
            @Expect("assertion#9307: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_97")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<UInt64>()])
            @Expect("assertion#9308: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_97")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt16, UInt64>>(), [])
            @Expect("assertion#9309: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_97")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9310: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_97")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt16, UInt64>>(), [])
            @Expect("assertion#9311: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_97")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9312: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_97")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt16, UInt64>>(),
                    [GenericStructWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#9313: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_97")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#9314: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_97")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt16, UInt64>>(), [()])
            @Expect("assertion#9315: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_97")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#9316: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_314 ends.")
    }

    @TestCase
    func TestCase_315(): Unit {
        // logger.info("testcase TestCase_315 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt64, Int16, Float64>>().getStaticFunctions("classStaticMemberFunction_98").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt64, Int16, Float64>>()
            .getStaticFunctions("classStaticMemberFunction_98")[0i64]
            .apply(TypeInfo.of<StandardClassType<UInt64, Int16, Float64>>(),
                [TypeInfo.of<Int32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()],
                [GenericStructWith1TypeParameters<Int32>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_98")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()],
                    [GenericStructWith1TypeParameters<Int32>()])
            @Expect("assertion#9317: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Int16, Float64> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_98")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#9318: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Int16, Float64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_98")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int16, Float64>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#9319: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_98")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int16, Float64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#9320: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_98")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9321: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Int16, Float64> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_98")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<UInt64>()],
                    [GenericStructWith1TypeParameters<Int32>(), 114.514000f64])
            @Expect("assertion#9322: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Int16, Float64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_98")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int16, Float64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Int32>(), 114.514000f64])
            @Expect("assertion#9323: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_98")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int16, Float64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#9324: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_98")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#9325: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Int16, Float64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_98")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int16, Float64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt64>()], [GenericStructWith1TypeParameters<Int32>()])
            @Expect("assertion#9326: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_98")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int16, Float64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Int32>()])
            @Expect("assertion#9327: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_98")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int16, Float64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#9328: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_98")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int16, Float64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9329: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_98")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int16, Float64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#9330: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_98")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int16, Float64>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#9331: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_98")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int16, Float64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()],
                    [GenericStructWith1TypeParameters<Int32>(), 114.514000f64])
            @Expect("assertion#9332: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_98")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int16, Float64>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()],
                    [GenericStructWith1TypeParameters<Int32>(), 114.514000f64])
            @Expect("assertion#9333: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_98")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int16, Float64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#9334: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_98")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int16, Float64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#9335: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_98")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int16, Float64>>(),
                    [GenericStructWith1TypeParameters<Int32>()])
            @Expect("assertion#9336: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_98")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<Int32>()])
            @Expect("assertion#9337: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_98")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int16, Float64>>(), [])
            @Expect("assertion#9338: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_98")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9339: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_98")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int16, Float64>>(), [])
            @Expect("assertion#9340: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_98")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9341: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_98")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int16, Float64>>(),
                    [GenericStructWith1TypeParameters<Int32>(), 114.514000f64])
            @Expect("assertion#9342: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_98")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<Int32>(), 114.514000f64])
            @Expect("assertion#9343: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_98")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int16, Float64>>(), [()])
            @Expect("assertion#9344: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_98")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#9345: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_315 ends.")
    }

    @TestCase
    func TestCase_316(): Unit {
        // logger.info("testcase TestCase_316 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int64, Int32, Float64>>().getStaticFunctions("classStaticMemberFunction_99").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int64, Int32, Float64>>()
            .getStaticFunctions("classStaticMemberFunction_99")[0i64]
            .apply(TypeInfo.of<StandardClassType<Int64, Int32, Float64>>(),
                [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int16>()],
                [GenericStructWith1TypeParameters<UInt64>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_99")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Int16>()],
                    [GenericStructWith1TypeParameters<UInt64>()])
            @Expect("assertion#9346: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, Int32, Float64> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_99")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#9347: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, Int32, Float64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_99")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Int32, Float64>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#9348: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_99")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Int32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#9349: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_99")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9350: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, Int32, Float64> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_99")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>()],
                    [GenericStructWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#9351: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, Int32, Float64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_99")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Int32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#9352: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_99")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Int32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#9353: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_99")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#9354: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, Int32, Float64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_99")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Int32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>()], [GenericStructWith1TypeParameters<UInt64>()])
            @Expect("assertion#9355: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_99")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Int32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<UInt64>()])
            @Expect("assertion#9356: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_99")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Int32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#9357: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_99")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Int32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9358: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_99")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Int32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#9359: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_99")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Int32, Float64>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#9360: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_99")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Int32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int16>()],
                    [GenericStructWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#9361: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_99")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Int32, Float64>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int16>()],
                    [GenericStructWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#9362: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_99")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Int32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#9363: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_99")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Int32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#9364: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_99")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Int32, Float64>>(),
                    [GenericStructWith1TypeParameters<UInt64>()])
            @Expect("assertion#9365: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_99")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<UInt64>()])
            @Expect("assertion#9366: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_99")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Int32, Float64>>(), [])
            @Expect("assertion#9367: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_99")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9368: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_99")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Int32, Float64>>(), [])
            @Expect("assertion#9369: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_99")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9370: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_99")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Int32, Float64>>(),
                    [GenericStructWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#9371: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_99")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#9372: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_99")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Int32, Float64>>(), [()])
            @Expect("assertion#9373: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_99")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#9374: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_316 ends.")
    }

    @TestCase
    func TestCase_317(): Unit {
        // logger.info("testcase TestCase_317 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int16, UInt64, Float32>>().getStaticFunctions("classStaticMemberFunction_100").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int16, UInt64, Float32>>()
            .getStaticFunctions("classStaticMemberFunction_100")[0i64]
            .apply(TypeInfo.of<StandardClassType<Int16, UInt64, Float32>>(),
                [TypeInfo.of<Int32>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt16>()],
                [GenericStructWith1TypeParameters<UInt16>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_100")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith1TypeParameters<UInt16>()])
            @Expect("assertion#9375: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, UInt64, Float32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_100")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#9376: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, UInt64, Float32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_100")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, UInt64, Float32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#9377: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_100")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, UInt64, Float32>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#9378: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_100")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9379: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, UInt64, Float32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_100")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<Int8>()],
                    [GenericStructWith1TypeParameters<UInt16>(), 114.514000f64])
            @Expect("assertion#9380: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, UInt64, Float32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_100")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, UInt64, Float32>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<UInt16>(), 114.514000f64])
            @Expect("assertion#9381: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_100")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, UInt64, Float32>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#9382: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_100")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#9383: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, UInt64, Float32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_100")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, UInt64, Float32>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int8>()], [GenericStructWith1TypeParameters<UInt16>()])
            @Expect("assertion#9384: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_100")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, UInt64, Float32>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<UInt16>()])
            @Expect("assertion#9385: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_100")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, UInt64, Float32>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#9386: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_100")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, UInt64, Float32>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9387: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_100")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, UInt64, Float32>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#9388: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_100")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, UInt64, Float32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#9389: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_100")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, UInt64, Float32>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith1TypeParameters<UInt16>(), 114.514000f64])
            @Expect("assertion#9390: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_100")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, UInt64, Float32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith1TypeParameters<UInt16>(), 114.514000f64])
            @Expect("assertion#9391: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_100")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, UInt64, Float32>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#9392: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_100")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, UInt64, Float32>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#9393: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_100")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, UInt64, Float32>>(),
                    [GenericStructWith1TypeParameters<UInt16>()])
            @Expect("assertion#9394: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_100")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<UInt16>()])
            @Expect("assertion#9395: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_100")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, UInt64, Float32>>(), [])
            @Expect("assertion#9396: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_100")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9397: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_100")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, UInt64, Float32>>(), [])
            @Expect("assertion#9398: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_100")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9399: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_100")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, UInt64, Float32>>(),
                    [GenericStructWith1TypeParameters<UInt16>(), 114.514000f64])
            @Expect("assertion#9400: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_100")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<UInt16>(), 114.514000f64])
            @Expect("assertion#9401: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_100")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, UInt64, Float32>>(), [()])
            @Expect("assertion#9402: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_100")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#9403: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_317 ends.")
    }
}
