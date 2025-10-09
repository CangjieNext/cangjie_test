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
class testGetStaticFunctions_StandardStructType_4 {
    @TestCase
    func TestCase_342(): Unit {
        // logger.info("testcase TestCase_342 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt64, Int8, Int8>>().getStaticFunctions("classStaticMemberFunction_125").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_125")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Int8, Int8>>(), [], [NonGenericClass()])
            @Expect("assertion#9960: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_125")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [NonGenericClass()])
            @Expect("assertion#9961: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_125")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#9962: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_125")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Int8, Int8>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#9963: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_125")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Int8, Int8>>(), [], [])
            @Expect("assertion#9964: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_125")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#9965: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_125")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Int8, Int8>>(), [], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#9966: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_125")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#9967: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_125")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Int8, Int8>>(), [], [()])
            @Expect("assertion#9968: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_125")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#9969: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt64, Int8, Int8>>()
            .getStaticFunctions("classStaticMemberFunction_125")[0i64]
            .apply(TypeInfo.of<StandardStructType<UInt64, Int8, Int8>>(), [NonGenericClass()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_125")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass()])
            @Expect("assertion#9970: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, Int8, Int8> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_125")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Int8, Int8>>(), [])
            @Expect("assertion#9971: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_125")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9972: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, Int8, Int8> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_125")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Int8, Int8>>(), [])
            @Expect("assertion#9973: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_125")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9974: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, Int8, Int8> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_125")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Int8, Int8>>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#9975: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_125")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#9976: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, Int8, Int8> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_125")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Int8, Int8>>(), [()])
            @Expect("assertion#9977: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_125")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#9978: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, Int8, Int8> got.")
        }
        // logger.info("testcase TestCase_342 ends.")
    }

    @TestCase
    func TestCase_343(): Unit {
        // logger.info("testcase TestCase_343 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int16, UInt8, UInt64>>().getStaticFunctions("classStaticMemberFunction_126").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_126")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt8, UInt64>>(), [],
                    [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#9979: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_126")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#9980: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_126")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#9981: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_126")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt8, UInt64>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#9982: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_126")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt8, UInt64>>(), [], [])
            @Expect("assertion#9983: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_126")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#9984: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_126")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt8, UInt64>>(), [],
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#9985: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_126")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#9986: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_126")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt8, UInt64>>(), [], [()])
            @Expect("assertion#9987: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_126")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#9988: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int16, UInt8, UInt64>>()
            .getStaticFunctions("classStaticMemberFunction_126")[0i64]
            .apply(TypeInfo.of<StandardStructType<Int16, UInt8, UInt64>>(), [GenericClassWith1TypeParameters<Int64>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_126")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#9989: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int16, UInt8, UInt64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_126")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt8, UInt64>>(), [])
            @Expect("assertion#9990: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_126")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9991: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int16, UInt8, UInt64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_126")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt8, UInt64>>(), [])
            @Expect("assertion#9992: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_126")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9993: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int16, UInt8, UInt64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_126")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt8, UInt64>>(),
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#9994: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_126")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#9995: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int16, UInt8, UInt64> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_126")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt8, UInt64>>(), [()])
            @Expect("assertion#9996: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_126")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#9997: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int16, UInt8, UInt64> got.")
        }
        // logger.info("testcase TestCase_343 ends.")
    }

    @TestCase
    func TestCase_344(): Unit {
        // logger.info("testcase TestCase_344 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt32, Int8, Int16>>().getStaticFunctions("classStaticMemberFunction_127").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_127")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Int8, Int16>>(), [],
                    [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#9998: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_127")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#9999: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_127")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#10000: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_127")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Int8, Int16>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10001: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_127")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Int8, Int16>>(), [], [])
            @Expect("assertion#10002: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_127")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10003: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_127")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Int8, Int16>>(), [],
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#10004: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_127")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#10005: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_127")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Int8, Int16>>(), [], [()])
            @Expect("assertion#10006: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_127")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#10007: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt32, Int8, Int16>>()
            .getStaticFunctions("classStaticMemberFunction_127")[0i64]
            .apply(TypeInfo.of<StandardStructType<UInt32, Int8, Int16>>(), [GenericClassWith1TypeParameters<Bool>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_127")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#10008: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt32, Int8, Int16> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_127")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Int8, Int16>>(), [])
            @Expect("assertion#10009: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_127")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10010: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt32, Int8, Int16> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_127")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Int8, Int16>>(), [])
            @Expect("assertion#10011: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_127")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10012: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt32, Int8, Int16> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_127")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Int8, Int16>>(),
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#10013: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_127")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#10014: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt32, Int8, Int16> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_127")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Int8, Int16>>(), [()])
            @Expect("assertion#10015: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_127")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#10016: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt32, Int8, Int16> got.")
        }
        // logger.info("testcase TestCase_344 ends.")
    }

    @TestCase
    func TestCase_345(): Unit {
        // logger.info("testcase TestCase_345 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int16, Float32, Bool>>().getStaticFunctions("classStaticMemberFunction_128").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_128")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Float32, Bool>>(), [],
                    [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#10017: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_128")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#10018: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_128")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#10019: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_128")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Float32, Bool>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10020: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_128")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Float32, Bool>>(), [], [])
            @Expect("assertion#10021: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_128")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10022: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_128")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Float32, Bool>>(), [],
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#10023: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_128")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#10024: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_128")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Float32, Bool>>(), [], [()])
            @Expect("assertion#10025: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_128")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#10026: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int16, Float32, Bool>>()
            .getStaticFunctions("classStaticMemberFunction_128")[0i64]
            .apply(TypeInfo.of<StandardStructType<Int16, Float32, Bool>>(), [GenericClassWith1TypeParameters<Unit>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_128")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#10027: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int16, Float32, Bool> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_128")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Float32, Bool>>(), [])
            @Expect("assertion#10028: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_128")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10029: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int16, Float32, Bool> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_128")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Float32, Bool>>(), [])
            @Expect("assertion#10030: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_128")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10031: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int16, Float32, Bool> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_128")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Float32, Bool>>(),
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#10032: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_128")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#10033: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int16, Float32, Bool> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_128")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Float32, Bool>>(), [()])
            @Expect("assertion#10034: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_128")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#10035: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int16, Float32, Bool> got.")
        }
        // logger.info("testcase TestCase_345 ends.")
    }

    @TestCase
    func TestCase_346(): Unit {
        // logger.info("testcase TestCase_346 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Unit, UInt8, Bool>>().getStaticFunctions("classStaticMemberFunction_129").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_129")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Bool>>(), [],
                    [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#10036: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_129")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#10037: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_129")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#10038: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_129")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Bool>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10039: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_129")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Bool>>(), [], [])
            @Expect("assertion#10040: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_129")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10041: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_129")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Bool>>(), [],
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#10042: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_129")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#10043: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_129")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Bool>>(), [], [()])
            @Expect("assertion#10044: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_129")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#10045: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Unit, UInt8, Bool>>()
            .getStaticFunctions("classStaticMemberFunction_129")[0i64]
            .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Bool>>(), [GenericClassWith1TypeParameters<Unit>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_129")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#10046: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, UInt8, Bool> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_129")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Bool>>(), [])
            @Expect("assertion#10047: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_129")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10048: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, UInt8, Bool> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_129")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Bool>>(), [])
            @Expect("assertion#10049: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_129")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10050: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, UInt8, Bool> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_129")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Bool>>(),
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#10051: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_129")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#10052: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, UInt8, Bool> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_129")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Bool>>(), [()])
            @Expect("assertion#10053: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_129")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#10054: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, UInt8, Bool> got.")
        }
        // logger.info("testcase TestCase_346 ends.")
    }
}
