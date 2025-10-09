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
class testGetStaticFunctions_StandardStructType_6 {
    @TestCase
    func TestCase_352(): Unit {
        // logger.info("testcase TestCase_352 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt8, Float32, Int16>>().getStaticFunctions("classStaticMemberFunction_135").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_135")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Float32, Int16>>(), [],
                    [GenericClassWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#10150: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_135")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [GenericClassWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#10151: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_135")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#10152: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_135")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Float32, Int16>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10153: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_135")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Float32, Int16>>(), [], [])
            @Expect("assertion#10154: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_135")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10155: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_135")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Float32, Int16>>(), [],
                    [GenericClassWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#10156: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_135")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericClassWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#10157: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_135")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Float32, Int16>>(), [], [()])
            @Expect("assertion#10158: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_135")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#10159: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt8, Float32, Int16>>()
            .getStaticFunctions("classStaticMemberFunction_135")[0i64]
            .apply(TypeInfo.of<StandardStructType<UInt8, Float32, Int16>>(),
                [GenericClassWith2TypeParameters<UInt8, UInt8>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_135")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#10160: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt8, Float32, Int16> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_135")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Float32, Int16>>(), [])
            @Expect("assertion#10161: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_135")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10162: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt8, Float32, Int16> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_135")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Float32, Int16>>(), [])
            @Expect("assertion#10163: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_135")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10164: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt8, Float32, Int16> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_135")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Float32, Int16>>(),
                    [GenericClassWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#10165: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_135")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#10166: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt8, Float32, Int16> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_135")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Float32, Int16>>(), [()])
            @Expect("assertion#10167: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_135")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#10168: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt8, Float32, Int16> got.")
        }
        // logger.info("testcase TestCase_352 ends.")
    }

    @TestCase
    func TestCase_353(): Unit {
        // logger.info("testcase TestCase_353 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt8, Float32, UInt32>>().getStaticFunctions("classStaticMemberFunction_136").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_136")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Float32, UInt32>>(), [],
                    [GenericClassWith2TypeParameters<Float32, Float32>()])
            @Expect("assertion#10169: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_136")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericClassWith2TypeParameters<Float32, Float32>()])
            @Expect("assertion#10170: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_136")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#10171: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_136")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Float32, UInt32>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10172: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_136")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Float32, UInt32>>(), [], [])
            @Expect("assertion#10173: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_136")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10174: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_136")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Float32, UInt32>>(), [],
                    [GenericClassWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#10175: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_136")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericClassWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#10176: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_136")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Float32, UInt32>>(), [], [()])
            @Expect("assertion#10177: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_136")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#10178: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt8, Float32, UInt32>>()
            .getStaticFunctions("classStaticMemberFunction_136")[0i64]
            .apply(TypeInfo.of<StandardStructType<UInt8, Float32, UInt32>>(),
                [GenericClassWith2TypeParameters<Float32, Float32>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_136")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Float32, Float32>()])
            @Expect("assertion#10179: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt8, Float32, UInt32> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_136")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Float32, UInt32>>(), [])
            @Expect("assertion#10180: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_136")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10181: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt8, Float32, UInt32> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_136")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Float32, UInt32>>(), [])
            @Expect("assertion#10182: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_136")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10183: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt8, Float32, UInt32> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_136")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Float32, UInt32>>(),
                    [GenericClassWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#10184: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_136")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#10185: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt8, Float32, UInt32> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_136")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Float32, UInt32>>(), [()])
            @Expect("assertion#10186: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_136")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#10187: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt8, Float32, UInt32> got.")
        }
        // logger.info("testcase TestCase_353 ends.")
    }

    @TestCase
    func TestCase_354(): Unit {
        // logger.info("testcase TestCase_354 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int8, Int8, UInt64>>().getStaticFunctions("classStaticMemberFunction_137").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_137")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Int8, UInt64>>(), [],
                    [GenericClassWith2TypeParameters<UInt64, UInt64>()])
            @Expect("assertion#10188: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_137")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericClassWith2TypeParameters<UInt64, UInt64>()])
            @Expect("assertion#10189: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_137")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#10190: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_137")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Int8, UInt64>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10191: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_137")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Int8, UInt64>>(), [], [])
            @Expect("assertion#10192: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_137")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10193: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_137")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Int8, UInt64>>(), [],
                    [GenericClassWith2TypeParameters<UInt64, UInt64>(), 114.514000f64])
            @Expect("assertion#10194: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_137")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericClassWith2TypeParameters<UInt64, UInt64>(), 114.514000f64])
            @Expect("assertion#10195: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_137")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Int8, UInt64>>(), [], [()])
            @Expect("assertion#10196: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_137")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#10197: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int8, Int8, UInt64>>()
            .getStaticFunctions("classStaticMemberFunction_137")[0i64]
            .apply(TypeInfo.of<StandardStructType<Int8, Int8, UInt64>>(),
                [GenericClassWith2TypeParameters<UInt64, UInt64>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_137")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<UInt64, UInt64>()])
            @Expect("assertion#10198: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int8, Int8, UInt64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_137")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Int8, UInt64>>(), [])
            @Expect("assertion#10199: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_137")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10200: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int8, Int8, UInt64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_137")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Int8, UInt64>>(), [])
            @Expect("assertion#10201: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_137")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10202: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int8, Int8, UInt64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_137")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Int8, UInt64>>(),
                    [GenericClassWith2TypeParameters<UInt64, UInt64>(), 114.514000f64])
            @Expect("assertion#10203: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_137")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<UInt64, UInt64>(), 114.514000f64])
            @Expect("assertion#10204: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int8, Int8, UInt64> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_137")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Int8, UInt64>>(), [()])
            @Expect("assertion#10205: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_137")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#10206: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int8, Int8, UInt64> got.")
        }
        // logger.info("testcase TestCase_354 ends.")
    }

    @TestCase
    func TestCase_355(): Unit {
        // logger.info("testcase TestCase_355 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt8, UInt8, Float64>>().getStaticFunctions("classStaticMemberFunction_138").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_138")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, UInt8, Float64>>(), [], [NonGenericStruct()])
            @Expect("assertion#10207: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_138")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [NonGenericStruct()])
            @Expect("assertion#10208: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_138")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#10209: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_138")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, UInt8, Float64>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10210: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_138")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, UInt8, Float64>>(), [], [])
            @Expect("assertion#10211: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_138")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10212: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_138")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, UInt8, Float64>>(), [], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#10213: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_138")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#10214: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_138")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, UInt8, Float64>>(), [], [()])
            @Expect("assertion#10215: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_138")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#10216: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt8, UInt8, Float64>>()
            .getStaticFunctions("classStaticMemberFunction_138")[0i64]
            .apply(TypeInfo.of<StandardStructType<UInt8, UInt8, Float64>>(), [NonGenericStruct()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_138")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct()])
            @Expect("assertion#10217: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt8, UInt8, Float64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_138")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, UInt8, Float64>>(), [])
            @Expect("assertion#10218: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_138")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10219: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt8, UInt8, Float64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_138")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, UInt8, Float64>>(), [])
            @Expect("assertion#10220: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_138")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10221: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt8, UInt8, Float64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_138")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, UInt8, Float64>>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#10222: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_138")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#10223: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt8, UInt8, Float64> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_138")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, UInt8, Float64>>(), [()])
            @Expect("assertion#10224: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_138")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#10225: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt8, UInt8, Float64> got.")
        }
        // logger.info("testcase TestCase_355 ends.")
    }

    @TestCase
    func TestCase_356(): Unit {
        // logger.info("testcase TestCase_356 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Bool, Float32, Unit>>().getStaticFunctions("classStaticMemberFunction_139").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_139")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Float32, Unit>>(), [], [NonGenericStruct()])
            @Expect("assertion#10226: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_139")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [NonGenericStruct()])
            @Expect("assertion#10227: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_139")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#10228: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_139")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Float32, Unit>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10229: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_139")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Float32, Unit>>(), [], [])
            @Expect("assertion#10230: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_139")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10231: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_139")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Float32, Unit>>(), [], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#10232: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_139")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#10233: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_139")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Float32, Unit>>(), [], [()])
            @Expect("assertion#10234: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_139")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#10235: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Bool, Float32, Unit>>()
            .getStaticFunctions("classStaticMemberFunction_139")[0i64]
            .apply(TypeInfo.of<StandardStructType<Bool, Float32, Unit>>(), [NonGenericStruct()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_139")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct()])
            @Expect("assertion#10236: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, Float32, Unit> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_139")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Float32, Unit>>(), [])
            @Expect("assertion#10237: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_139")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10238: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, Float32, Unit> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_139")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Float32, Unit>>(), [])
            @Expect("assertion#10239: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_139")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10240: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, Float32, Unit> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_139")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Float32, Unit>>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#10241: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_139")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#10242: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, Float32, Unit> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_139")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Float32, Unit>>(), [()])
            @Expect("assertion#10243: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_139")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#10244: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, Float32, Unit> got.")
        }
        // logger.info("testcase TestCase_356 ends.")
    }
}
