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
class testGetStaticFunctions_StandardStructType_20 {
    @TestCase
    func TestCase_425(): Unit {
        // logger.info("testcase TestCase_425 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt8, Int64, Unit>>().getStaticFunctions("classStaticMemberFunction_208").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt8, Int64, Unit>>()
            .getStaticFunctions("classStaticMemberFunction_208")[0i64]
            .apply(TypeInfo.of<StandardStructType<UInt8, Int64, Unit>>(),
                [TypeInfo.of<Int32>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>()],
                [GenericStructWith1TypeParameters<UInt64>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_208")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith1TypeParameters<UInt64>()])
            @Expect("assertion#12057: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt8, Int64, Unit> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_208")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#12058: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt8, Int64, Unit> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_208")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int64, Unit>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#12059: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_208")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int64, Unit>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#12060: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_208")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#12061: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt8, Int64, Unit> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_208")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<UInt64>()],
                    [GenericStructWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#12062: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt8, Int64, Unit> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_208")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int64, Unit>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#12063: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_208")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int64, Unit>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#12064: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_208")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#12065: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt8, Int64, Unit> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_208")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int64, Unit>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt64>()], [GenericStructWith1TypeParameters<UInt64>()])
            @Expect("assertion#12066: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_208")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int64, Unit>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<UInt64>()])
            @Expect("assertion#12067: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_208")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int64, Unit>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#12068: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_208")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int64, Unit>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#12069: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_208")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int64, Unit>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#12070: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_208")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int64, Unit>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#12071: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_208")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int64, Unit>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#12072: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_208")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int64, Unit>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#12073: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_208")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int64, Unit>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#12074: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_208")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int64, Unit>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#12075: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_208")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int64, Unit>>(),
                    [GenericStructWith1TypeParameters<UInt64>()])
            @Expect("assertion#12076: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_208")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<UInt64>()])
            @Expect("assertion#12077: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_208")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int64, Unit>>(), [])
            @Expect("assertion#12078: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_208")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#12079: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_208")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int64, Unit>>(), [])
            @Expect("assertion#12080: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_208")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#12081: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_208")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int64, Unit>>(),
                    [GenericStructWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#12082: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_208")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#12083: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_208")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int64, Unit>>(), [()])
            @Expect("assertion#12084: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_208")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#12085: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_425 ends.")
    }
}
