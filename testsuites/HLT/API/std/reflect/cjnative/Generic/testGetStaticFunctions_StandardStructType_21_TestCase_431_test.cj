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
    func TestCase_431(): Unit {
        // logger.info("testcase TestCase_431 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Bool, Int32, Bool>>().getStaticFunctions("classStaticMemberFunction_214").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Bool, Int32, Bool>>()
            .getStaticFunctions("classStaticMemberFunction_214")[0i64]
            .apply(TypeInfo.of<StandardStructType<Bool, Int32, Bool>>(),
                [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>()],
                [GenericStructWith2TypeParameters<Int32, Int32>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_214")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int16>()],
                    [GenericStructWith2TypeParameters<Int32, Int32>()])
            @Expect("assertion#12231: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, Int32, Bool> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_214")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#12232: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, Int32, Bool> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_214")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int32, Bool>>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int16>()],
                    [])
            @Expect("assertion#12233: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_214")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int32, Bool>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#12234: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_214")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#12235: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, Int32, Bool> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_214")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<Unit>()],
                    [GenericStructWith2TypeParameters<Int32, Int32>(), 114.514000f64])
            @Expect("assertion#12236: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, Int32, Bool> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_214")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int32, Bool>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Int32, Int32>(), 114.514000f64])
            @Expect("assertion#12237: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_214")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int32, Bool>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#12238: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_214")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#12239: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, Int32, Bool> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_214")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int32, Bool>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>()], [GenericStructWith2TypeParameters<Int32, Int32>()])
            @Expect("assertion#12240: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_214")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int32, Bool>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Int32, Int32>()])
            @Expect("assertion#12241: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_214")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int32, Bool>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#12242: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_214")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int32, Bool>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#12243: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_214")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int32, Bool>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#12244: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_214")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int32, Bool>>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int16>()],
                    [])
            @Expect("assertion#12245: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_214")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int32, Bool>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>()],
                    [GenericStructWith2TypeParameters<Int32, Int32>(), 114.514000f64])
            @Expect("assertion#12246: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_214")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int32, Bool>>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int16>()],
                    [GenericStructWith2TypeParameters<Int32, Int32>(), 114.514000f64])
            @Expect("assertion#12247: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_214")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int32, Bool>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#12248: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_214")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int32, Bool>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#12249: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_214")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int32, Bool>>(),
                    [GenericStructWith2TypeParameters<Int32, Int32>()])
            @Expect("assertion#12250: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_214")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Int32, Int32>()])
            @Expect("assertion#12251: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_214")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int32, Bool>>(), [])
            @Expect("assertion#12252: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_214")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#12253: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_214")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int32, Bool>>(), [])
            @Expect("assertion#12254: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_214")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#12255: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_214")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int32, Bool>>(),
                    [GenericStructWith2TypeParameters<Int32, Int32>(), 114.514000f64])
            @Expect("assertion#12256: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_214")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Int32, Int32>(), 114.514000f64])
            @Expect("assertion#12257: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_214")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int32, Bool>>(), [()])
            @Expect("assertion#12258: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_214")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#12259: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_431 ends.")
    }
}
