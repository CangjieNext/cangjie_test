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
class testGetStaticFunctions_StandardStructType_21 {
    @TestCase
    func TestCase_428(): Unit {
        // logger.info("testcase TestCase_428 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt32, UInt64, UInt16>>().getStaticFunctions("classStaticMemberFunction_211").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt32, UInt64, UInt16>>()
            .getStaticFunctions("classStaticMemberFunction_211")[0i64]
            .apply(TypeInfo.of<StandardStructType<UInt32, UInt64, UInt16>>(),
                [TypeInfo.of<Int8>(), TypeInfo.of<Int32>(), TypeInfo.of<Bool>()],
                [GenericStructWith2TypeParameters<Bool, Bool>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_211")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<Bool>()],
                    [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#12144: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt32, UInt64, UInt16> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_211")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#12145: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt32, UInt64, UInt16> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_211")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt64, UInt16>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#12146: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_211")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt64, UInt16>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#12147: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_211")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#12148: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt32, UInt64, UInt16> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_211")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int32>()],
                    [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#12149: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt32, UInt64, UInt16> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_211")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt64, UInt16>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#12150: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_211")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt64, UInt16>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int32>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#12151: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_211")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#12152: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt32, UInt64, UInt16> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_211")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt64, UInt16>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int32>()], [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#12153: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_211")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt64, UInt16>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#12154: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_211")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt64, UInt16>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#12155: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_211")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt64, UInt16>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#12156: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_211")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt64, UInt16>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#12157: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_211")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt64, UInt16>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#12158: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_211")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt64, UInt16>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int32>(), TypeInfo.of<Bool>()],
                    [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#12159: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_211")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt64, UInt16>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Bool>()],
                    [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#12160: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_211")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt64, UInt16>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#12161: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_211")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt64, UInt16>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#12162: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_211")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt64, UInt16>>(),
                    [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#12163: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_211")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#12164: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_211")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt64, UInt16>>(), [])
            @Expect("assertion#12165: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_211")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#12166: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_211")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt64, UInt16>>(), [])
            @Expect("assertion#12167: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_211")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#12168: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_211")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt64, UInt16>>(),
                    [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#12169: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_211")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#12170: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_211")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt64, UInt16>>(), [()])
            @Expect("assertion#12171: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_211")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#12172: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_428 ends.")
    }
}
