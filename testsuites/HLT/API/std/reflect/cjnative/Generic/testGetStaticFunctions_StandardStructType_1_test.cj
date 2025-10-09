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
class testGetStaticFunctions_StandardStructType_1 {
    @TestCase
    func TestCase_327(): Unit {
        // logger.info("testcase TestCase_327 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int32, UInt8, UInt32>>().getStaticFunctions("classStaticMemberFunction_110").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt8, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_110")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt8, UInt32>>(), [], [])
            @Expect("assertion#9665: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt8, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_110")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#9666: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt8, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_110")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [114.514000f64])
            @Expect("assertion#9667: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt8, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_110")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt8, UInt32>>(), [TypeInfo.of<Float32>()],
                    [114.514000f64])
            @Expect("assertion#9668: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int32, UInt8, UInt32>>()
            .getStaticFunctions("classStaticMemberFunction_110")[0i64]
            .apply(TypeInfo.of<StandardStructType<Int32, UInt8, UInt32>>(), [])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt8, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_110")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9669: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int32, UInt8, UInt32> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt8, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_110")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt8, UInt32>>(), [114.514000f64])
            @Expect("assertion#9670: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt8, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_110")[0i64]
                .apply(TypeInfo.of<Int64>(), [114.514000f64])
            @Expect("assertion#9671: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int32, UInt8, UInt32> got.")
        }
        // logger.info("testcase TestCase_327 ends.")
    }

    @TestCase
    func TestCase_328(): Unit {
        // logger.info("testcase TestCase_328 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Float32, Int32, Unit>>().getStaticFunctions("classStaticMemberFunction_111").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Float32, Int32, Unit>>()
            .getStaticFunctions("classStaticMemberFunction_111")[0i64]
            .apply(TypeInfo.of<StandardStructType<Float32, Int32, Unit>>(),
                [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int16>()], [])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_111")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#9672: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float32, Int32, Unit> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_111")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int16>()],
                    [114.514000f64])
            @Expect("assertion#9673: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float32, Int32, Unit> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_111")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int32, Unit>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int16>()], [114.514000f64])
            @Expect("assertion#9674: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_111")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int32, Unit>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#9675: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_111")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int32, Unit>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9676: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_111")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>()], [114.514000f64])
            @Expect("assertion#9677: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float32, Int32, Unit> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_111")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [114.514000f64])
            @Expect("assertion#9678: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float32, Int32, Unit> got.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_111")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int32, Unit>>(), [])
            @Expect("assertion#9679: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_111")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9680: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_111")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int32, Unit>>(), [114.514000f64])
            @Expect("assertion#9681: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_111")[0i64]
                .apply(TypeInfo.of<Int64>(), [114.514000f64])
            @Expect("assertion#9682: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_328 ends.")
    }

    @TestCase
    func TestCase_329(): Unit {
        // logger.info("testcase TestCase_329 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Bool, UInt32, Int32>>().getStaticFunctions("classStaticMemberFunction_112").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_112")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt32, Int32>>(), [],
                    [1i32, NonGenericClass(), GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#9683: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_112")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [1i32, NonGenericClass(), GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#9684: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_112")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [NonGenericClass(), GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#9685: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_112")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt32, Int32>>(), [TypeInfo.of<Float32>()],
                    [NonGenericClass(), GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#9686: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_112")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt32, Int32>>(), [], [1i32, NonGenericClass()])
            @Expect("assertion#9687: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_112")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [1i32, NonGenericClass()])
            @Expect("assertion#9688: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_112")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt32, Int32>>(), [],
                    [1i32, NonGenericClass(), GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#9689: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_112")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [1i32, NonGenericClass(), GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#9690: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_112")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt32, Int32>>(), [],
                    [114.514000f64, NonGenericClass(), GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#9691: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_112")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [114.514000f64, NonGenericClass(), GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#9692: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_112")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt32, Int32>>(), [],
                    [1i32, (), GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#9693: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_112")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [1i32, (), GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#9694: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_112")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt32, Int32>>(), [], [1i32, NonGenericClass(), ()])
            @Expect("assertion#9695: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_112")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [1i32, NonGenericClass(), ()])
            @Expect("assertion#9696: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Bool, UInt32, Int32>>()
            .getStaticFunctions("classStaticMemberFunction_112")[0i64]
            .apply(TypeInfo.of<StandardStructType<Bool, UInt32, Int32>>(),
                [1i32, NonGenericClass(), GenericClassWith1TypeParameters<Int64>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_112")[0i64]
                .apply(TypeInfo.of<Int64>(), [1i32, NonGenericClass(), GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#9697: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, UInt32, Int32> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_112")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt32, Int32>>(),
                    [NonGenericClass(), GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#9698: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_112")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass(), GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#9699: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, UInt32, Int32> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_112")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt32, Int32>>(), [1i32, NonGenericClass()])
            @Expect("assertion#9700: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_112")[0i64]
                .apply(TypeInfo.of<Int64>(), [1i32, NonGenericClass()])
            @Expect("assertion#9701: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, UInt32, Int32> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_112")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt32, Int32>>(),
                    [1i32, NonGenericClass(), GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#9702: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_112")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [1i32, NonGenericClass(), GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#9703: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, UInt32, Int32> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_112")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt32, Int32>>(),
                    [114.514000f64, NonGenericClass(), GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#9704: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_112")[0i64]
                .apply(TypeInfo.of<Int64>(), [114.514000f64, NonGenericClass(), GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#9705: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, UInt32, Int32> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_112")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt32, Int32>>(),
                    [1i32, (), GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#9706: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_112")[0i64]
                .apply(TypeInfo.of<Int64>(), [1i32, (), GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#9707: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, UInt32, Int32> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_112")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt32, Int32>>(), [1i32, NonGenericClass(), ()])
            @Expect("assertion#9708: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_112")[0i64]
                .apply(TypeInfo.of<Int64>(), [1i32, NonGenericClass(), ()])
            @Expect("assertion#9709: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, UInt32, Int32> got.")
        }
        // logger.info("testcase TestCase_329 ends.")
    }

    @TestCase
    func TestCase_330(): Unit {
        // logger.info("testcase TestCase_330 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt64, UInt64, Int16>>().getStaticFunctions("classStaticMemberFunction_113").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt64, UInt64, Int16>>()
            .getStaticFunctions("classStaticMemberFunction_113")[0i64]
            .apply(TypeInfo.of<StandardStructType<UInt64, UInt64, Int16>>(),
                [TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>()],
                [GenericStructWith1TypeParameters<Int16>(), NonGenericClass(), NonGenericClass()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith1TypeParameters<Int16>(), NonGenericClass(), NonGenericClass()])
            @Expect("assertion#9710: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, UInt64, Int16> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>()],
                    [NonGenericClass(), NonGenericClass()])
            @Expect("assertion#9711: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, UInt64, Int16> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt64, Int16>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>()], [NonGenericClass(), NonGenericClass()])
            @Expect("assertion#9712: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt64, Int16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith1TypeParameters<Int16>(), NonGenericClass()])
            @Expect("assertion#9713: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Int16>(), NonGenericClass()])
            @Expect("assertion#9714: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, UInt64, Int16> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith1TypeParameters<Int16>(), NonGenericClass(), NonGenericClass(), 114.514000f64])
            @Expect("assertion#9715: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, UInt64, Int16> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt64, Int16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Int16>(), NonGenericClass(), NonGenericClass(), 114.514000f64])
            @Expect("assertion#9716: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt64, Int16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>()],
                    [(), NonGenericClass(), NonGenericClass()])
            @Expect("assertion#9717: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>()],
                    [(), NonGenericClass(), NonGenericClass()])
            @Expect("assertion#9718: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, UInt64, Int16> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt64, Int16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith1TypeParameters<Int16>(), (), NonGenericClass()])
            @Expect("assertion#9719: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith1TypeParameters<Int16>(), (), NonGenericClass()])
            @Expect("assertion#9720: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, UInt64, Int16> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt64, Int16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith1TypeParameters<Int16>(), NonGenericClass(), ()])
            @Expect("assertion#9721: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith1TypeParameters<Int16>(), NonGenericClass(), ()])
            @Expect("assertion#9722: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, UInt64, Int16> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt64, Int16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith1TypeParameters<Int16>(), NonGenericClass(), NonGenericClass()])
            @Expect("assertion#9723: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt64, Int16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Int16>(), NonGenericClass(), NonGenericClass()])
            @Expect("assertion#9724: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt64, Int16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>()], [NonGenericClass(), NonGenericClass()])
            @Expect("assertion#9725: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt64, Int16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), NonGenericClass()])
            @Expect("assertion#9726: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt64, Int16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith1TypeParameters<Int16>(), NonGenericClass()])
            @Expect("assertion#9727: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt64, Int16>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith1TypeParameters<Int16>(), NonGenericClass()])
            @Expect("assertion#9728: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt64, Int16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith1TypeParameters<Int16>(), NonGenericClass(), NonGenericClass(), 114.514000f64])
            @Expect("assertion#9729: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt64, Int16>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith1TypeParameters<Int16>(), NonGenericClass(), NonGenericClass(), 114.514000f64])
            @Expect("assertion#9730: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt64, Int16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>()], [(), NonGenericClass(), NonGenericClass()])
            @Expect("assertion#9731: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt64, Int16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [(), NonGenericClass(), NonGenericClass()])
            @Expect("assertion#9732: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt64, Int16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith1TypeParameters<Int16>(), (), NonGenericClass()])
            @Expect("assertion#9733: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt64, Int16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Int16>(), (), NonGenericClass()])
            @Expect("assertion#9734: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt64, Int16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith1TypeParameters<Int16>(), NonGenericClass(), ()])
            @Expect("assertion#9735: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt64, Int16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Int16>(), NonGenericClass(), ()])
            @Expect("assertion#9736: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt64, Int16>>(),
                    [GenericStructWith1TypeParameters<Int16>(), NonGenericClass(), NonGenericClass()])
            @Expect("assertion#9737: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [GenericStructWith1TypeParameters<Int16>(), NonGenericClass(), NonGenericClass()])
            @Expect("assertion#9738: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt64, Int16>>(), [NonGenericClass(), NonGenericClass()])
            @Expect("assertion#9739: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass(), NonGenericClass()])
            @Expect("assertion#9740: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt64, Int16>>(),
                    [GenericStructWith1TypeParameters<Int16>(), NonGenericClass()])
            @Expect("assertion#9741: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<Int16>(), NonGenericClass()])
            @Expect("assertion#9742: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt64, Int16>>(),
                    [GenericStructWith1TypeParameters<Int16>(), NonGenericClass(), NonGenericClass(), 114.514000f64])
            @Expect("assertion#9743: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [GenericStructWith1TypeParameters<Int16>(), NonGenericClass(), NonGenericClass(), 114.514000f64])
            @Expect("assertion#9744: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt64, Int16>>(),
                    [(), NonGenericClass(), NonGenericClass()])
            @Expect("assertion#9745: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<Int64>(), [(), NonGenericClass(), NonGenericClass()])
            @Expect("assertion#9746: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt64, Int16>>(),
                    [GenericStructWith1TypeParameters<Int16>(), (), NonGenericClass()])
            @Expect("assertion#9747: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<Int16>(), (), NonGenericClass()])
            @Expect("assertion#9748: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt64, Int16>>(),
                    [GenericStructWith1TypeParameters<Int16>(), NonGenericClass(), ()])
            @Expect("assertion#9749: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<Int16>(), NonGenericClass(), ()])
            @Expect("assertion#9750: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_330 ends.")
    }

    @TestCase
    func TestCase_331(): Unit {
        // logger.info("testcase TestCase_331 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt8, Int32, Int8>>().getStaticFunctions("classStaticMemberFunction_114").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_114")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int32, Int8>>(), [], [123i64])
            @Expect("assertion#9751: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_114")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [123i64])
            @Expect("assertion#9752: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_114")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#9753: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_114")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int32, Int8>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#9754: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_114")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int32, Int8>>(), [], [])
            @Expect("assertion#9755: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_114")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#9756: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_114")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int32, Int8>>(), [], [123i64, 114.514000f64])
            @Expect("assertion#9757: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_114")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [123i64, 114.514000f64])
            @Expect("assertion#9758: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_114")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int32, Int8>>(), [], [114.514000f64])
            @Expect("assertion#9759: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_114")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [114.514000f64])
            @Expect("assertion#9760: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt8, Int32, Int8>>()
            .getStaticFunctions("classStaticMemberFunction_114")[0i64]
            .apply(TypeInfo.of<StandardStructType<UInt8, Int32, Int8>>(), [123i64])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_114")[0i64]
                .apply(TypeInfo.of<Int64>(), [123i64])
            @Expect("assertion#9761: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt8, Int32, Int8> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_114")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int32, Int8>>(), [])
            @Expect("assertion#9762: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_114")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9763: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt8, Int32, Int8> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_114")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int32, Int8>>(), [])
            @Expect("assertion#9764: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_114")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9765: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt8, Int32, Int8> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_114")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int32, Int8>>(), [123i64, 114.514000f64])
            @Expect("assertion#9766: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_114")[0i64]
                .apply(TypeInfo.of<Int64>(), [123i64, 114.514000f64])
            @Expect("assertion#9767: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt8, Int32, Int8> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_114")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int32, Int8>>(), [114.514000f64])
            @Expect("assertion#9768: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_114")[0i64]
                .apply(TypeInfo.of<Int64>(), [114.514000f64])
            @Expect("assertion#9769: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt8, Int32, Int8> got.")
        }
        // logger.info("testcase TestCase_331 ends.")
    }
}
