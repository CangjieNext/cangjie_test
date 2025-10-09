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
class testGetStaticFunctions_StandardStructType_8 {
    @TestCase
    func TestCase_362(): Unit {
        // logger.info("testcase TestCase_362 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Float32, Int32, Int8>>().getStaticFunctions("classStaticMemberFunction_145").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_145")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int32, Int8>>(), [],
                    [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#10340: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_145")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#10341: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_145")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#10342: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_145")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int32, Int8>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10343: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_145")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int32, Int8>>(), [], [])
            @Expect("assertion#10344: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_145")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10345: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_145")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int32, Int8>>(), [],
                    [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#10346: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_145")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#10347: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_145")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int32, Int8>>(), [], [()])
            @Expect("assertion#10348: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_145")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#10349: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Float32, Int32, Int8>>()
            .getStaticFunctions("classStaticMemberFunction_145")[0i64]
            .apply(TypeInfo.of<StandardStructType<Float32, Int32, Int8>>(), [GenericStructWith1TypeParameters<Bool>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_145")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#10350: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float32, Int32, Int8> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_145")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int32, Int8>>(), [])
            @Expect("assertion#10351: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_145")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10352: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float32, Int32, Int8> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_145")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int32, Int8>>(), [])
            @Expect("assertion#10353: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_145")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10354: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float32, Int32, Int8> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_145")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int32, Int8>>(),
                    [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#10355: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_145")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#10356: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float32, Int32, Int8> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_145")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int32, Int8>>(), [()])
            @Expect("assertion#10357: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_145")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#10358: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float32, Int32, Int8> got.")
        }
        // logger.info("testcase TestCase_362 ends.")
    }

    @TestCase
    func TestCase_363(): Unit {
        // logger.info("testcase TestCase_363 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt32, UInt32, Unit>>().getStaticFunctions("classStaticMemberFunction_146").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_146")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt32, Unit>>(), [],
                    [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#10359: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_146")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#10360: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_146")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#10361: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_146")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt32, Unit>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10362: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_146")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt32, Unit>>(), [], [])
            @Expect("assertion#10363: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_146")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10364: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_146")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt32, Unit>>(), [],
                    [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#10365: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_146")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#10366: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_146")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt32, Unit>>(), [], [()])
            @Expect("assertion#10367: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_146")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#10368: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt32, UInt32, Unit>>()
            .getStaticFunctions("classStaticMemberFunction_146")[0i64]
            .apply(TypeInfo.of<StandardStructType<UInt32, UInt32, Unit>>(), [GenericStructWith1TypeParameters<Unit>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_146")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#10369: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt32, UInt32, Unit> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_146")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt32, Unit>>(), [])
            @Expect("assertion#10370: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_146")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10371: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt32, UInt32, Unit> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_146")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt32, Unit>>(), [])
            @Expect("assertion#10372: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_146")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10373: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt32, UInt32, Unit> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_146")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt32, Unit>>(),
                    [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#10374: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_146")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#10375: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt32, UInt32, Unit> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_146")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt32, Unit>>(), [()])
            @Expect("assertion#10376: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_146")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#10377: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt32, UInt32, Unit> got.")
        }
        // logger.info("testcase TestCase_363 ends.")
    }

    @TestCase
    func TestCase_364(): Unit {
        // logger.info("testcase TestCase_364 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Float64, Int8, Float64>>().getStaticFunctions("classStaticMemberFunction_147").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_147")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int8, Float64>>(), [],
                    [GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#10378: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_147")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#10379: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_147")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#10380: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_147")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int8, Float64>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10381: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_147")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int8, Float64>>(), [], [])
            @Expect("assertion#10382: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_147")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10383: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_147")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int8, Float64>>(), [],
                    [GenericStructWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#10384: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_147")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericStructWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#10385: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_147")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int8, Float64>>(), [], [()])
            @Expect("assertion#10386: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_147")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#10387: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Float64, Int8, Float64>>()
            .getStaticFunctions("classStaticMemberFunction_147")[0i64]
            .apply(TypeInfo.of<StandardStructType<Float64, Int8, Float64>>(),
                [GenericStructWith1TypeParameters<Float64>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_147")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#10388: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, Int8, Float64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_147")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int8, Float64>>(), [])
            @Expect("assertion#10389: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_147")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10390: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, Int8, Float64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_147")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int8, Float64>>(), [])
            @Expect("assertion#10391: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_147")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10392: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, Int8, Float64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_147")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int8, Float64>>(),
                    [GenericStructWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#10393: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_147")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#10394: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, Int8, Float64> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_147")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int8, Float64>>(), [()])
            @Expect("assertion#10395: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_147")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#10396: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, Int8, Float64> got.")
        }
        // logger.info("testcase TestCase_364 ends.")
    }

    @TestCase
    func TestCase_365(): Unit {
        // logger.info("testcase TestCase_365 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt16, UInt64, Int32>>().getStaticFunctions("classStaticMemberFunction_148").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_148")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, UInt64, Int32>>(), [],
                    [GenericStructWith1TypeParameters<UInt64>()])
            @Expect("assertion#10397: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_148")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<UInt64>()])
            @Expect("assertion#10398: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_148")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#10399: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_148")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, UInt64, Int32>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10400: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_148")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, UInt64, Int32>>(), [], [])
            @Expect("assertion#10401: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_148")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10402: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_148")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, UInt64, Int32>>(), [],
                    [GenericStructWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#10403: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_148")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericStructWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#10404: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_148")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, UInt64, Int32>>(), [], [()])
            @Expect("assertion#10405: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_148")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#10406: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt16, UInt64, Int32>>()
            .getStaticFunctions("classStaticMemberFunction_148")[0i64]
            .apply(TypeInfo.of<StandardStructType<UInt16, UInt64, Int32>>(),
                [GenericStructWith1TypeParameters<UInt64>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_148")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<UInt64>()])
            @Expect("assertion#10407: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, UInt64, Int32> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_148")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, UInt64, Int32>>(), [])
            @Expect("assertion#10408: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_148")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10409: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, UInt64, Int32> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_148")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, UInt64, Int32>>(), [])
            @Expect("assertion#10410: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_148")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10411: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, UInt64, Int32> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_148")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, UInt64, Int32>>(),
                    [GenericStructWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#10412: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_148")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#10413: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, UInt64, Int32> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_148")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, UInt64, Int32>>(), [()])
            @Expect("assertion#10414: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_148")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#10415: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, UInt64, Int32> got.")
        }
        // logger.info("testcase TestCase_365 ends.")
    }

    @TestCase
    func TestCase_366(): Unit {
        // logger.info("testcase TestCase_366 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt8, UInt64, UInt8>>().getStaticFunctions("classStaticMemberFunction_149").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_149")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, UInt64, UInt8>>(), [],
                    [GenericStructWith1TypeParameters<UInt8>()])
            @Expect("assertion#10416: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_149")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<UInt8>()])
            @Expect("assertion#10417: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_149")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#10418: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_149")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, UInt64, UInt8>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10419: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_149")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, UInt64, UInt8>>(), [], [])
            @Expect("assertion#10420: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_149")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10421: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_149")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, UInt64, UInt8>>(), [],
                    [GenericStructWith1TypeParameters<UInt8>(), 114.514000f64])
            @Expect("assertion#10422: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_149")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericStructWith1TypeParameters<UInt8>(), 114.514000f64])
            @Expect("assertion#10423: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_149")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, UInt64, UInt8>>(), [], [()])
            @Expect("assertion#10424: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_149")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#10425: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt8, UInt64, UInt8>>()
            .getStaticFunctions("classStaticMemberFunction_149")[0i64]
            .apply(TypeInfo.of<StandardStructType<UInt8, UInt64, UInt8>>(), [GenericStructWith1TypeParameters<UInt8>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_149")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<UInt8>()])
            @Expect("assertion#10426: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt8, UInt64, UInt8> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_149")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, UInt64, UInt8>>(), [])
            @Expect("assertion#10427: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_149")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10428: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt8, UInt64, UInt8> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_149")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, UInt64, UInt8>>(), [])
            @Expect("assertion#10429: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_149")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10430: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt8, UInt64, UInt8> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_149")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, UInt64, UInt8>>(),
                    [GenericStructWith1TypeParameters<UInt8>(), 114.514000f64])
            @Expect("assertion#10431: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_149")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<UInt8>(), 114.514000f64])
            @Expect("assertion#10432: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt8, UInt64, UInt8> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_149")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, UInt64, UInt8>>(), [()])
            @Expect("assertion#10433: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_149")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#10434: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt8, UInt64, UInt8> got.")
        }
        // logger.info("testcase TestCase_366 ends.")
    }
}
