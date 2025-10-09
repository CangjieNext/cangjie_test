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
class testGetStaticFunctions_StandardStructType_13 {
    @TestCase
    func TestCase_387(): Unit {
        // logger.info("testcase TestCase_387 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int16, UInt32, Int8>>().getStaticFunctions("classStaticMemberFunction_170").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int16, UInt32, Int8>>()
            .getStaticFunctions("classStaticMemberFunction_170")[0i64]
            .apply(TypeInfo.of<StandardStructType<Int16, UInt32, Int8>>(),
                [TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<Int16>()], [NonGenericClass()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_170")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<Int16>()], [NonGenericClass()])
            @Expect("assertion#10955: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int16, UInt32, Int8> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_170")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#10956: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int16, UInt32, Int8> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_170")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt32, Int8>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#10957: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_170")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt32, Int8>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#10958: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_170")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10959: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int16, UInt32, Int8> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_170")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<Bool>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10960: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int16, UInt32, Int8> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_170")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt32, Int8>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10961: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_170")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt32, Int8>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#10962: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_170")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#10963: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int16, UInt32, Int8> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_170")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt32, Int8>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Bool>()], [NonGenericClass()])
            @Expect("assertion#10964: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_170")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt32, Int8>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#10965: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_170")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt32, Int8>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#10966: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_170")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt32, Int8>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10967: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_170")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt32, Int8>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#10968: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_170")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt32, Int8>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#10969: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_170")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt32, Int8>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<Int16>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10970: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_170")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt32, Int8>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Int16>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10971: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_170")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt32, Int8>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#10972: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_170")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt32, Int8>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#10973: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_170")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt32, Int8>>(), [NonGenericClass()])
            @Expect("assertion#10974: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_170")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass()])
            @Expect("assertion#10975: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_170")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt32, Int8>>(), [])
            @Expect("assertion#10976: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_170")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10977: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_170")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt32, Int8>>(), [])
            @Expect("assertion#10978: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_170")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10979: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_170")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt32, Int8>>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10980: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_170")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10981: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_170")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt32, Int8>>(), [()])
            @Expect("assertion#10982: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_170")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#10983: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_387 ends.")
    }

    @TestCase
    func TestCase_388(): Unit {
        // logger.info("testcase TestCase_388 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt16, Int32, Float64>>().getStaticFunctions("classStaticMemberFunction_171").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt16, Int32, Float64>>()
            .getStaticFunctions("classStaticMemberFunction_171")[0i64]
            .apply(TypeInfo.of<StandardStructType<UInt16, Int32, Float64>>(),
                [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [NonGenericClass()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_171")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [NonGenericClass()])
            @Expect("assertion#10984: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, Int32, Float64> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_171")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#10985: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, Int32, Float64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_171")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int32, Float64>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#10986: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_171")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#10987: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_171")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10988: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, Int32, Float64> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_171")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10989: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, Int32, Float64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_171")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10990: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_171")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#10991: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_171")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#10992: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, Int32, Float64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_171")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [NonGenericClass()])
            @Expect("assertion#10993: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_171")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#10994: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_171")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#10995: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_171")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10996: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_171")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#10997: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_171")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int32, Float64>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#10998: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_171")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10999: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_171")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int32, Float64>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#11000: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_171")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#11001: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_171")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#11002: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_171")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int32, Float64>>(), [NonGenericClass()])
            @Expect("assertion#11003: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_171")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass()])
            @Expect("assertion#11004: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_171")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int32, Float64>>(), [])
            @Expect("assertion#11005: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_171")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11006: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_171")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int32, Float64>>(), [])
            @Expect("assertion#11007: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_171")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11008: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_171")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int32, Float64>>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#11009: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_171")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#11010: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_171")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int32, Float64>>(), [()])
            @Expect("assertion#11011: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_171")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#11012: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_388 ends.")
    }

    @TestCase
    func TestCase_389(): Unit {
        // logger.info("testcase TestCase_389 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Unit, UInt8, Unit>>().getStaticFunctions("classStaticMemberFunction_172").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Unit, UInt8, Unit>>()
            .getStaticFunctions("classStaticMemberFunction_172")[0i64]
            .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Unit>>(),
                [TypeInfo.of<UInt64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int32>()], [NonGenericClass()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_172")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Int32>()], [NonGenericClass()])
            @Expect("assertion#11013: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, UInt8, Unit> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_172")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#11014: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, UInt8, Unit> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_172")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Unit>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#11015: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_172")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Unit>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#11016: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_172")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11017: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, UInt8, Unit> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_172")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt64>(), TypeInfo.of<UInt32>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#11018: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, UInt8, Unit> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_172")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Unit>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#11019: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_172")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Unit>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#11020: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_172")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#11021: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, UInt8, Unit> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_172")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Unit>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<UInt32>()], [NonGenericClass()])
            @Expect("assertion#11022: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_172")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Unit>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#11023: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_172")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Unit>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#11024: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_172")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Unit>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11025: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_172")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Unit>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#11026: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_172")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Unit>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#11027: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_172")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Unit>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int32>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#11028: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_172")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Unit>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#11029: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_172")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Unit>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#11030: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_172")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Unit>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#11031: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_172")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Unit>>(), [NonGenericClass()])
            @Expect("assertion#11032: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_172")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass()])
            @Expect("assertion#11033: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_172")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Unit>>(), [])
            @Expect("assertion#11034: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_172")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11035: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_172")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Unit>>(), [])
            @Expect("assertion#11036: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_172")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11037: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_172")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Unit>>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#11038: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_172")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#11039: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_172")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Unit>>(), [()])
            @Expect("assertion#11040: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_172")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#11041: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_389 ends.")
    }

    @TestCase
    func TestCase_390(): Unit {
        // logger.info("testcase TestCase_390 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt64, Bool, UInt16>>().getStaticFunctions("classStaticMemberFunction_173").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt64, Bool, UInt16>>()
            .getStaticFunctions("classStaticMemberFunction_173")[0i64]
            .apply(TypeInfo.of<StandardStructType<UInt64, Bool, UInt16>>(),
                [TypeInfo.of<Bool>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [NonGenericClass()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_173")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [NonGenericClass()])
            @Expect("assertion#11042: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, Bool, UInt16> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_173")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#11043: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, Bool, UInt16> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_173")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Bool, UInt16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#11044: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_173")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Bool, UInt16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#11045: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_173")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11046: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, Bool, UInt16> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_173")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<UInt8>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#11047: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, Bool, UInt16> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_173")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Bool, UInt16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#11048: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_173")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Bool, UInt16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#11049: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_173")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#11050: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, Bool, UInt16> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_173")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Bool, UInt16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt8>()], [NonGenericClass()])
            @Expect("assertion#11051: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_173")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Bool, UInt16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#11052: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_173")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Bool, UInt16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#11053: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_173")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Bool, UInt16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11054: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_173")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Bool, UInt16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#11055: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_173")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Bool, UInt16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#11056: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_173")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Bool, UInt16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#11057: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_173")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Bool, UInt16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#11058: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_173")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Bool, UInt16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#11059: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_173")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Bool, UInt16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#11060: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_173")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Bool, UInt16>>(), [NonGenericClass()])
            @Expect("assertion#11061: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_173")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass()])
            @Expect("assertion#11062: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_173")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Bool, UInt16>>(), [])
            @Expect("assertion#11063: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_173")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11064: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_173")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Bool, UInt16>>(), [])
            @Expect("assertion#11065: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_173")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11066: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_173")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Bool, UInt16>>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#11067: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_173")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#11068: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_173")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Bool, UInt16>>(), [()])
            @Expect("assertion#11069: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_173")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#11070: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_390 ends.")
    }

    @TestCase
    func TestCase_391(): Unit {
        // logger.info("testcase TestCase_391 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt64, Float64, Bool>>().getStaticFunctions("classStaticMemberFunction_174").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt64, Float64, Bool>>()
            .getStaticFunctions("classStaticMemberFunction_174")[0i64]
            .apply(TypeInfo.of<StandardStructType<UInt64, Float64, Bool>>(),
                [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt32>()],
                [GenericClassWith1TypeParameters<Int64>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Float64, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_174")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<UInt32>()],
                    [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#11071: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, Float64, Bool> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Float64, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_174")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#11072: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, Float64, Bool> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Float64, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_174")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Float64, Bool>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#11073: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Float64, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_174")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Float64, Bool>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#11074: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Float64, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_174")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11075: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, Float64, Bool> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Float64, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_174")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()],
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#11076: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, Float64, Bool> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Float64, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_174")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Float64, Bool>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#11077: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Float64, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_174")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Float64, Bool>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#11078: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Float64, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_174")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#11079: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, Float64, Bool> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Float64, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_174")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Float64, Bool>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#11080: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Float64, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_174")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Float64, Bool>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#11081: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Float64, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_174")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Float64, Bool>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#11082: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Float64, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_174")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Float64, Bool>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11083: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Float64, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_174")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Float64, Bool>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#11084: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Float64, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_174")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Float64, Bool>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#11085: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Float64, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_174")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Float64, Bool>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt32>()],
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#11086: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Float64, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_174")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Float64, Bool>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt32>()],
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#11087: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Float64, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_174")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Float64, Bool>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#11088: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Float64, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_174")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Float64, Bool>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#11089: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Float64, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_174")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Float64, Bool>>(),
                    [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#11090: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Float64, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_174")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#11091: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Float64, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_174")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Float64, Bool>>(), [])
            @Expect("assertion#11092: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Float64, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_174")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11093: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Float64, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_174")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Float64, Bool>>(), [])
            @Expect("assertion#11094: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Float64, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_174")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11095: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Float64, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_174")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Float64, Bool>>(),
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#11096: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Float64, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_174")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#11097: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Float64, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_174")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Float64, Bool>>(), [()])
            @Expect("assertion#11098: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Float64, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_174")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#11099: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_391 ends.")
    }
}
