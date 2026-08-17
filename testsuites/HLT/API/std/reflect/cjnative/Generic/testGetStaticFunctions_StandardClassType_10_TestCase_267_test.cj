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
class testGetStaticFunctions_StandardClassType_10 {
    @TestCase
    func TestCase_267(): Unit {
        // logger.info("testcase TestCase_267 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int64, Float64, UInt64>>().getStaticFunctions("classStaticMemberFunction_50").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int64, Float64, UInt64>>()
            .getStaticFunctions("classStaticMemberFunction_50")[0i64]
            .apply(TypeInfo.of<StandardClassType<Int64, Float64, UInt64>>(),
                [TypeInfo.of<UInt8>(), TypeInfo.of<Bool>(), TypeInfo.of<Int64>()], [123i64])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_50")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<Int64>()], [123i64])
            @Expect("assertion#7925: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, Float64, UInt64> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_50")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Bool>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#7926: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, Float64, UInt64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_50")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float64, UInt64>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#7927: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_50")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float64, UInt64>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#7928: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_50")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Bool>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#7929: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, Float64, UInt64> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_50")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [123i64, 114.514000f64])
            @Expect("assertion#7930: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, Float64, UInt64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_50")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float64, UInt64>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Bool>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [123i64, 114.514000f64])
            @Expect("assertion#7931: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_50")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float64, UInt64>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Bool>(), TypeInfo.of<Int64>()], [114.514000f64])
            @Expect("assertion#7932: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_50")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<Int64>()], [114.514000f64])
            @Expect("assertion#7933: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, Float64, UInt64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_50")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float64, UInt64>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [123i64])
            @Expect("assertion#7934: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_50")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float64, UInt64>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Bool>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [123i64])
            @Expect("assertion#7935: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_50")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float64, UInt64>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#7936: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_50")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float64, UInt64>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Bool>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#7937: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_50")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float64, UInt64>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Bool>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#7938: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_50")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float64, UInt64>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#7939: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_50")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float64, UInt64>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Bool>(), TypeInfo.of<Int64>()], [123i64, 114.514000f64])
            @Expect("assertion#7940: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_50")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float64, UInt64>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Int64>()], [123i64, 114.514000f64])
            @Expect("assertion#7941: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_50")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float64, UInt64>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [114.514000f64])
            @Expect("assertion#7942: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_50")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float64, UInt64>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Bool>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [114.514000f64])
            @Expect("assertion#7943: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_50")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float64, UInt64>>(), [123i64])
            @Expect("assertion#7944: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_50")[0i64]
                .apply(TypeInfo.of<Int64>(), [123i64])
            @Expect("assertion#7945: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_50")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float64, UInt64>>(), [])
            @Expect("assertion#7946: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_50")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7947: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_50")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float64, UInt64>>(), [])
            @Expect("assertion#7948: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_50")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7949: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_50")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float64, UInt64>>(), [123i64, 114.514000f64])
            @Expect("assertion#7950: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_50")[0i64]
                .apply(TypeInfo.of<Int64>(), [123i64, 114.514000f64])
            @Expect("assertion#7951: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_50")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float64, UInt64>>(), [114.514000f64])
            @Expect("assertion#7952: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_50")[0i64]
                .apply(TypeInfo.of<Int64>(), [114.514000f64])
            @Expect("assertion#7953: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_267 ends.")
    }
}
