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
class testGetStaticFunctions_StandardStructType_19 {
    @TestCase
    func TestCase_421(): Unit {
        // logger.info("testcase TestCase_421 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt16, UInt32, Float64>>().getStaticFunctions("classStaticMemberFunction_204").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt16, UInt32, Float64>>()
            .getStaticFunctions("classStaticMemberFunction_204")[0i64]
            .apply(TypeInfo.of<StandardStructType<UInt16, UInt32, Float64>>(),
                [TypeInfo.of<Int8>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt32>()],
                [GenericStructWith1TypeParameters<UInt16>()])
        // logger.info("类型错误")
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
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_204")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#11942: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, UInt32, Float64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("类型错误")
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
        // logger.info("类型错误")
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
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("类型检查失败")
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
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_204")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#11949: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, UInt32, Float64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("实参个数与形参个数不等")
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
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("实参个数与形参个数不等")
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
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("函数为泛型，类型形参列表未指定")
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
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_204")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<UInt16>()])
            @Expect("assertion#11961: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_204")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, UInt32, Float64>>(), [])
            @Expect("assertion#11962: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_204")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11963: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_204")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, UInt32, Float64>>(), [])
            @Expect("assertion#11964: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_204")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11965: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
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
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_204")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<UInt16>(), 114.514000f64])
            @Expect("assertion#11967: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_204")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, UInt32, Float64>>(), [()])
            @Expect("assertion#11968: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_204")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#11969: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_421 ends.")
    }
}
