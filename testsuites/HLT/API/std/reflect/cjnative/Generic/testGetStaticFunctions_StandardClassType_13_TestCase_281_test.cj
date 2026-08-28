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
class testGetStaticFunctions_StandardClassType_13 {
    @TestCase
    func TestCase_281(): Unit {
        // logger.info("testcase TestCase_281 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Unit, Int32, UInt8>>().getStaticFunctions("classStaticMemberFunction_64").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Unit, Int32, UInt8>>()
            .getStaticFunctions("classStaticMemberFunction_64")[0i64]
            .apply(TypeInfo.of<StandardClassType<Unit, Int32, UInt8>>(),
                [TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()], [NonGenericClass()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_64")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()], [NonGenericClass()])
            @Expect("assertion#8331: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Unit, Int32, UInt8> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_64")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#8332: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Unit, Int32, UInt8> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_64")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Int32, UInt8>>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()],
                    [])
            @Expect("assertion#8333: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_64")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Int32, UInt8>>(), [TypeInfo.of<Bool>(), TypeInfo.of<Unit>()],
                    [])
            @Expect("assertion#8334: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_64")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8335: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Unit, Int32, UInt8> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_64")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<Unit>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8336: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Unit, Int32, UInt8> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_64")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Int32, UInt8>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8337: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_64")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Int32, UInt8>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#8338: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_64")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#8339: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Unit, Int32, UInt8> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_64")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Int32, UInt8>>(), [TypeInfo.of<Bool>(), TypeInfo.of<Unit>()],
                    [NonGenericClass()])
            @Expect("assertion#8340: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_64")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Int32, UInt8>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#8341: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_64")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Int32, UInt8>>(), [TypeInfo.of<Bool>(), TypeInfo.of<Unit>()],
                    [])
            @Expect("assertion#8342: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_64")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Int32, UInt8>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8343: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_64")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Int32, UInt8>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#8344: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_64")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Int32, UInt8>>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()],
                    [])
            @Expect("assertion#8345: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_64")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Int32, UInt8>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8346: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_64")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Int32, UInt8>>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8347: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_64")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Int32, UInt8>>(), [TypeInfo.of<Bool>(), TypeInfo.of<Unit>()],
                    [()])
            @Expect("assertion#8348: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_64")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Int32, UInt8>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8349: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_64")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Int32, UInt8>>(), [NonGenericClass()])
            @Expect("assertion#8350: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_64")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass()])
            @Expect("assertion#8351: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_64")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Int32, UInt8>>(), [])
            @Expect("assertion#8352: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_64")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8353: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_64")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Int32, UInt8>>(), [])
            @Expect("assertion#8354: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_64")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8355: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_64")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Int32, UInt8>>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8356: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_64")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8357: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_64")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Int32, UInt8>>(), [()])
            @Expect("assertion#8358: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_64")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#8359: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_281 ends.")
    }
}
