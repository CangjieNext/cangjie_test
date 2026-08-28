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
class testGetStaticFunctions_StandardStructType_15 {
    @TestCase
    func TestCase_400(): Unit {
        // logger.info("testcase TestCase_400 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Bool, Int64, Int64>>().getStaticFunctions("classStaticMemberFunction_183").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Bool, Int64, Int64>>()
            .getStaticFunctions("classStaticMemberFunction_183")[0i64]
            .apply(TypeInfo.of<StandardStructType<Bool, Int64, Int64>>(),
                [TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt64>()],
                [GenericClassWith2TypeParameters<Int64, Int64>()])
        // logger.info("类型错误")
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
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_183")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#11333: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, Int64, Int64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("类型错误")
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
        // logger.info("类型错误")
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
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("类型检查失败")
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
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_183")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#11340: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, Int64, Int64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("实参个数与形参个数不等")
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
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("实参个数与形参个数不等")
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
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("函数为泛型，类型形参列表未指定")
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
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_183")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#11352: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_183")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int64, Int64>>(), [])
            @Expect("assertion#11353: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_183")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11354: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_183")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int64, Int64>>(), [])
            @Expect("assertion#11355: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_183")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11356: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
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
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_183")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#11358: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_183")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int64, Int64>>(), [()])
            @Expect("assertion#11359: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_183")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#11360: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_400 ends.")
    }
}
