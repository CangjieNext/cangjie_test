/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1 
// DEPENDENCE: dependency
// EXEC: %compiler %cmp_opt %compile_library dependency/*.cj -o libdependency.%library_suffix
// EXEC: %compiler %cmp_opt -L. -ldependency %f %cmp_utest_opt -o %output
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args  
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
}
