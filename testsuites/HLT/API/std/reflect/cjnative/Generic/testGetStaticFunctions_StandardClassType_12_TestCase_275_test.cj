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
class testGetStaticFunctions_StandardClassType_12 {
    @TestCase
    func TestCase_275(): Unit {
        // logger.info("testcase TestCase_275 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Bool, Unit, Int16>>().getStaticFunctions("classStaticMemberFunction_58").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Bool, Unit, Int16>>()
            .getStaticFunctions("classStaticMemberFunction_58")[0i64]
            .apply(TypeInfo.of<StandardClassType<Bool, Unit, Int16>>(),
                [TypeInfo.of<UInt16>(), TypeInfo.of<Int16>(), TypeInfo.of<Float32>()], [NonGenericClass()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_58")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<Float32>()], [NonGenericClass()])
            @Expect("assertion#8157: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Bool, Unit, Int16> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_58")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Int16>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#8158: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Bool, Unit, Int16> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("类型错误")
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
        // logger.info("类型错误")
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
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("类型检查失败")
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
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_58")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#8165: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Bool, Unit, Int16> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("实参个数与形参个数不等")
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
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("实参个数与形参个数不等")
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
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_58")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Unit, Int16>>(), [NonGenericClass()])
            @Expect("assertion#8176: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_58")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass()])
            @Expect("assertion#8177: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_58")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Unit, Int16>>(), [])
            @Expect("assertion#8178: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_58")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8179: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_58")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Unit, Int16>>(), [])
            @Expect("assertion#8180: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_58")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8181: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_58")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Unit, Int16>>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8182: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_58")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8183: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_58")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Unit, Int16>>(), [()])
            @Expect("assertion#8184: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_58")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#8185: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_275 ends.")
    }
}
