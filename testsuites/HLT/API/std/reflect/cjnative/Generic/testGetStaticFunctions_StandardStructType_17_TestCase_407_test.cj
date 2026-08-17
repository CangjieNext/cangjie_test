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
class testGetStaticFunctions_StandardStructType_17 {
    @TestCase
    func TestCase_407(): Unit {
        // logger.info("testcase TestCase_407 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt8, Bool, Float32>>().getStaticFunctions("classStaticMemberFunction_190").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt8, Bool, Float32>>()
            .getStaticFunctions("classStaticMemberFunction_190")[0i64]
            .apply(TypeInfo.of<StandardStructType<UInt8, Bool, Float32>>(),
                [TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()],
                [GenericClassWith2TypeParameters<Unit, Unit>()])
        // logger.info("类型错误")
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
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_190")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#11536: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt8, Bool, Float32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("类型错误")
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
        // logger.info("类型错误")
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
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("类型检查失败")
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
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_190")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#11543: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt8, Bool, Float32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("实参个数与形参个数不等")
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
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("实参个数与形参个数不等")
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
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("函数为泛型，类型形参列表未指定")
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
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_190")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#11555: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_190")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Bool, Float32>>(), [])
            @Expect("assertion#11556: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_190")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11557: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_190")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Bool, Float32>>(), [])
            @Expect("assertion#11558: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_190")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11559: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
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
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_190")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#11561: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_190")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Bool, Float32>>(), [()])
            @Expect("assertion#11562: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_190")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#11563: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_407 ends.")
    }
}
