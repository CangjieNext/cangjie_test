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
class testGetStaticFunctions_StandardStructType_12 {
    @TestCase
    func TestCase_382(): Unit {
        // logger.info("testcase TestCase_382 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>().getStaticFunctions("classStaticMemberFunction_165").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Unit, UInt8, UInt64>>()
            .getStaticFunctions("classStaticMemberFunction_165")[0i64]
            .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                [TypeInfo.of<Unit>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt8>()], [NonGenericClass()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_165")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<UInt8>()], [NonGenericClass()])
            @Expect("assertion#10810: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, UInt8, UInt64> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_165")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#10811: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, UInt8, UInt64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_165")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#10812: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_165")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#10813: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_165")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10814: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, UInt8, UInt64> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_165")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int32>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10815: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, UInt8, UInt64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_165")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10816: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_165")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#10817: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_165")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#10818: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, UInt8, UInt64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_165")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int32>()], [NonGenericClass()])
            @Expect("assertion#10819: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_165")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#10820: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_165")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#10821: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_165")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10822: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_165")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#10823: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_165")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#10824: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_165")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt8>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10825: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_165")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt8>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10826: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_165")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#10827: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_165")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#10828: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_165")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(), [NonGenericClass()])
            @Expect("assertion#10829: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_165")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass()])
            @Expect("assertion#10830: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_165")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(), [])
            @Expect("assertion#10831: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_165")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10832: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_165")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(), [])
            @Expect("assertion#10833: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_165")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10834: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_165")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10835: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_165")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10836: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_165")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(), [()])
            @Expect("assertion#10837: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_165")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#10838: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_382 ends.")
    }

    @TestCase
    func TestCase_383(): Unit {
        // logger.info("testcase TestCase_383 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Bool, UInt8, Int32>>().getStaticFunctions("classStaticMemberFunction_166").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Bool, UInt8, Int32>>()
            .getStaticFunctions("classStaticMemberFunction_166")[0i64]
            .apply(TypeInfo.of<StandardStructType<Bool, UInt8, Int32>>(),
                [TypeInfo.of<Float32>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt32>()], [NonGenericClass()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_166")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<UInt32>()], [NonGenericClass()])
            @Expect("assertion#10839: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, UInt8, Int32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_166")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#10840: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, UInt8, Int32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_166")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt8, Int32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#10841: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_166")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt8, Int32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#10842: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_166")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10843: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, UInt8, Int32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_166")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>(), TypeInfo.of<Int8>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10844: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, UInt8, Int32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_166")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt8, Int32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10845: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_166")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt8, Int32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#10846: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_166")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#10847: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, UInt8, Int32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_166")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt8, Int32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int8>()], [NonGenericClass()])
            @Expect("assertion#10848: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_166")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt8, Int32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#10849: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_166")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt8, Int32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#10850: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_166")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt8, Int32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10851: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_166")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt8, Int32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#10852: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_166")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt8, Int32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#10853: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_166")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt8, Int32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt32>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10854: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_166")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt8, Int32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10855: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_166")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt8, Int32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#10856: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_166")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt8, Int32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#10857: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_166")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt8, Int32>>(), [NonGenericClass()])
            @Expect("assertion#10858: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_166")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass()])
            @Expect("assertion#10859: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_166")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt8, Int32>>(), [])
            @Expect("assertion#10860: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_166")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10861: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_166")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt8, Int32>>(), [])
            @Expect("assertion#10862: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_166")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10863: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_166")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt8, Int32>>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10864: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_166")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10865: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_166")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt8, Int32>>(), [()])
            @Expect("assertion#10866: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_166")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#10867: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_383 ends.")
    }

    @TestCase
    func TestCase_384(): Unit {
        // logger.info("testcase TestCase_384 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int16, UInt64, UInt64>>().getStaticFunctions("classStaticMemberFunction_167").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int16, UInt64, UInt64>>()
            .getStaticFunctions("classStaticMemberFunction_167")[0i64]
            .apply(TypeInfo.of<StandardStructType<Int16, UInt64, UInt64>>(),
                [TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [NonGenericClass()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_167")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [NonGenericClass()])
            @Expect("assertion#10868: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int16, UInt64, UInt64> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_167")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#10869: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int16, UInt64, UInt64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_167")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt64, UInt64>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#10870: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_167")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt64, UInt64>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#10871: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_167")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10872: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int16, UInt64, UInt64> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_167")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<UInt16>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10873: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int16, UInt64, UInt64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_167")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt64, UInt64>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10874: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_167")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt64, UInt64>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#10875: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_167")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#10876: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int16, UInt64, UInt64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_167")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt64, UInt64>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt16>()], [NonGenericClass()])
            @Expect("assertion#10877: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_167")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt64, UInt64>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#10878: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_167")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt64, UInt64>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#10879: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_167")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt64, UInt64>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10880: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_167")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt64, UInt64>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#10881: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_167")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt64, UInt64>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#10882: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_167")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt64, UInt64>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10883: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_167")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt64, UInt64>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10884: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_167")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt64, UInt64>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#10885: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_167")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt64, UInt64>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#10886: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_167")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt64, UInt64>>(), [NonGenericClass()])
            @Expect("assertion#10887: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_167")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass()])
            @Expect("assertion#10888: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_167")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt64, UInt64>>(), [])
            @Expect("assertion#10889: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_167")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10890: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_167")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt64, UInt64>>(), [])
            @Expect("assertion#10891: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_167")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10892: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_167")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt64, UInt64>>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10893: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_167")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10894: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_167")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt64, UInt64>>(), [()])
            @Expect("assertion#10895: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_167")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#10896: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_384 ends.")
    }

    @TestCase
    func TestCase_385(): Unit {
        // logger.info("testcase TestCase_385 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt32, Bool, Float64>>().getStaticFunctions("classStaticMemberFunction_168").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt32, Bool, Float64>>()
            .getStaticFunctions("classStaticMemberFunction_168")[0i64]
            .apply(TypeInfo.of<StandardStructType<UInt32, Bool, Float64>>(),
                [TypeInfo.of<Bool>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()], [NonGenericClass()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_168")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()], [NonGenericClass()])
            @Expect("assertion#10897: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt32, Bool, Float64> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_168")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#10898: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt32, Bool, Float64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_168")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Bool, Float64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#10899: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_168")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Bool, Float64>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10900: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_168")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10901: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt32, Bool, Float64> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_168")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10902: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt32, Bool, Float64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_168")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Bool, Float64>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10903: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_168")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Bool, Float64>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#10904: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_168")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#10905: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt32, Bool, Float64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_168")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Bool, Float64>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [NonGenericClass()])
            @Expect("assertion#10906: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_168")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Bool, Float64>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#10907: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_168")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Bool, Float64>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10908: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_168")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Bool, Float64>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10909: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_168")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Bool, Float64>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#10910: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_168")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Bool, Float64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#10911: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_168")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Bool, Float64>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10912: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_168")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Bool, Float64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10913: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_168")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Bool, Float64>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#10914: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_168")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Bool, Float64>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#10915: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_168")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Bool, Float64>>(), [NonGenericClass()])
            @Expect("assertion#10916: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_168")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass()])
            @Expect("assertion#10917: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_168")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Bool, Float64>>(), [])
            @Expect("assertion#10918: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_168")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10919: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_168")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Bool, Float64>>(), [])
            @Expect("assertion#10920: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_168")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10921: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_168")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Bool, Float64>>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10922: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_168")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10923: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_168")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Bool, Float64>>(), [()])
            @Expect("assertion#10924: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_168")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#10925: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_385 ends.")
    }

    @TestCase
    func TestCase_386(): Unit {
        // logger.info("testcase TestCase_386 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int64, Int64, Float32>>().getStaticFunctions("classStaticMemberFunction_169").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int64, Int64, Float32>>()
            .getStaticFunctions("classStaticMemberFunction_169")[0i64]
            .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(),
                [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()], [NonGenericClass()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_169")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()], [NonGenericClass()])
            @Expect("assertion#10926: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int64, Int64, Float32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_169")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#10927: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int64, Int64, Float32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_169")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#10928: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_169")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#10929: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_169")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10930: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int64, Int64, Float32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_169")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10931: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int64, Int64, Float32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_169")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10932: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_169")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#10933: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_169")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#10934: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int64, Int64, Float32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_169")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [NonGenericClass()])
            @Expect("assertion#10935: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_169")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#10936: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_169")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#10937: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_169")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10938: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_169")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#10939: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_169")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#10940: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_169")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10941: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_169")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10942: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_169")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#10943: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_169")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#10944: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_169")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(), [NonGenericClass()])
            @Expect("assertion#10945: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_169")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass()])
            @Expect("assertion#10946: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_169")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(), [])
            @Expect("assertion#10947: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_169")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10948: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_169")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(), [])
            @Expect("assertion#10949: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_169")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10950: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_169")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10951: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_169")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10952: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_169")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(), [()])
            @Expect("assertion#10953: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_169")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#10954: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_386 ends.")
    }
}
