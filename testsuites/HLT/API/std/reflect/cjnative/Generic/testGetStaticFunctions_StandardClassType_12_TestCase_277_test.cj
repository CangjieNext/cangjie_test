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
    func TestCase_277(): Unit {
        // logger.info("testcase TestCase_277 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt32, UInt8, UInt16>>().getStaticFunctions("classStaticMemberFunction_60").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt32, UInt8, UInt16>>()
            .getStaticFunctions("classStaticMemberFunction_60")[0i64]
            .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, UInt16>>(),
                [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()], [NonGenericClass()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_60")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()], [NonGenericClass()])
            @Expect("assertion#8215: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, UInt8, UInt16> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_60")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#8216: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, UInt8, UInt16> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_60")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, UInt16>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#8217: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_60")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#8218: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_60")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8219: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, UInt8, UInt16> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_60")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8220: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, UInt8, UInt16> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_60")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8221: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_60")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#8222: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_60")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#8223: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, UInt8, UInt16> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_60")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [NonGenericClass()])
            @Expect("assertion#8224: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_60")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#8225: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_60")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#8226: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_60")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8227: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_60")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#8228: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_60")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, UInt16>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#8229: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_60")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8230: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_60")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, UInt16>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8231: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_60")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#8232: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_60")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8233: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_60")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, UInt16>>(), [NonGenericClass()])
            @Expect("assertion#8234: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_60")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass()])
            @Expect("assertion#8235: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_60")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, UInt16>>(), [])
            @Expect("assertion#8236: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_60")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8237: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_60")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, UInt16>>(), [])
            @Expect("assertion#8238: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_60")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8239: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_60")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, UInt16>>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8240: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_60")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8241: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_60")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, UInt16>>(), [()])
            @Expect("assertion#8242: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_60")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#8243: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_277 ends.")
    }
}
