/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
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
class testGetStaticFunctions_StandardClassType_2 {
    @TestCase
    func TestCase_223(): Unit {
        // logger.info("testcase TestCase_223 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Float32, Int32, Unit>>().getStaticFunctions("classStaticMemberFunction_6").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_6")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int32, Unit>>(), [], [true])
            @Expect("assertion#7059: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_6")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [true])
            @Expect("assertion#7060: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_6")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#7061: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_6")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int32, Unit>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7062: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_6")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int32, Unit>>(), [], [])
            @Expect("assertion#7063: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_6")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7064: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_6")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int32, Unit>>(), [], [true, 114.514000f64])
            @Expect("assertion#7065: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_6")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [true, 114.514000f64])
            @Expect("assertion#7066: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_6")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int32, Unit>>(), [], [()])
            @Expect("assertion#7067: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_6")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#7068: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Float32, Int32, Unit>>()
            .getStaticFunctions("classStaticMemberFunction_6")[0i64]
            .apply(TypeInfo.of<StandardClassType<Float32, Int32, Unit>>(), [true])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_6")[0i64]
                .apply(TypeInfo.of<Int64>(), [true])
            @Expect("assertion#7069: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float32, Int32, Unit> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_6")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int32, Unit>>(), [])
            @Expect("assertion#7070: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_6")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7071: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float32, Int32, Unit> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_6")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int32, Unit>>(), [])
            @Expect("assertion#7072: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_6")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7073: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float32, Int32, Unit> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_6")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int32, Unit>>(), [true, 114.514000f64])
            @Expect("assertion#7074: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_6")[0i64]
                .apply(TypeInfo.of<Int64>(), [true, 114.514000f64])
            @Expect("assertion#7075: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float32, Int32, Unit> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_6")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int32, Unit>>(), [()])
            @Expect("assertion#7076: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_6")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#7077: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float32, Int32, Unit> got.")
        }
        // logger.info("testcase TestCase_223 ends.")
    }

    @TestCase
    func TestCase_224(): Unit {
        // logger.info("testcase TestCase_224 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt32, Float64, Int32>>().getStaticFunctions("classStaticMemberFunction_7").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Float64, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_7")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Float64, Int32>>(), [], [()])
            @Expect("assertion#7078: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Float64, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_7")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#7079: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Float64, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_7")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#7080: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Float64, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_7")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Float64, Int32>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7081: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Float64, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_7")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Float64, Int32>>(), [], [])
            @Expect("assertion#7082: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Float64, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_7")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7083: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Float64, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_7")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Float64, Int32>>(), [], [(), 114.514000f64])
            @Expect("assertion#7084: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Float64, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_7")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [(), 114.514000f64])
            @Expect("assertion#7085: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Float64, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_7")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Float64, Int32>>(), [], [123i64])
            @Expect("assertion#7086: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Float64, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_7")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [123i64])
            @Expect("assertion#7087: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt32, Float64, Int32>>()
            .getStaticFunctions("classStaticMemberFunction_7")[0i64]
            .apply(TypeInfo.of<StandardClassType<UInt32, Float64, Int32>>(), [()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Float64, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_7")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#7088: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, Float64, Int32> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Float64, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_7")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Float64, Int32>>(), [])
            @Expect("assertion#7089: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Float64, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_7")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7090: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, Float64, Int32> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Float64, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_7")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Float64, Int32>>(), [])
            @Expect("assertion#7091: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Float64, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_7")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7092: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, Float64, Int32> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Float64, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_7")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Float64, Int32>>(), [(), 114.514000f64])
            @Expect("assertion#7093: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Float64, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_7")[0i64]
                .apply(TypeInfo.of<Int64>(), [(), 114.514000f64])
            @Expect("assertion#7094: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, Float64, Int32> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Float64, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_7")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Float64, Int32>>(), [123i64])
            @Expect("assertion#7095: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Float64, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_7")[0i64]
                .apply(TypeInfo.of<Int64>(), [123i64])
            @Expect("assertion#7096: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, Float64, Int32> got.")
        }
        // logger.info("testcase TestCase_224 ends.")
    }

    @TestCase
    func TestCase_225(): Unit {
        // logger.info("testcase TestCase_225 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int8, Int16, Int64>>().getStaticFunctions("classStaticMemberFunction_8").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_8")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, Int16, Int64>>(), [], [1i8])
            @Expect("assertion#7097: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_8")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [1i8])
            @Expect("assertion#7098: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_8")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#7099: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_8")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, Int16, Int64>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7100: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_8")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, Int16, Int64>>(), [], [])
            @Expect("assertion#7101: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_8")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7102: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_8")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, Int16, Int64>>(), [], [1i8, 114.514000f64])
            @Expect("assertion#7103: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_8")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [1i8, 114.514000f64])
            @Expect("assertion#7104: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_8")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, Int16, Int64>>(), [], [114.514000f64])
            @Expect("assertion#7105: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_8")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [114.514000f64])
            @Expect("assertion#7106: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int8, Int16, Int64>>()
            .getStaticFunctions("classStaticMemberFunction_8")[0i64]
            .apply(TypeInfo.of<StandardClassType<Int8, Int16, Int64>>(), [1i8])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_8")[0i64]
                .apply(TypeInfo.of<Int64>(), [1i8])
            @Expect("assertion#7107: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int8, Int16, Int64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_8")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, Int16, Int64>>(), [])
            @Expect("assertion#7108: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_8")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7109: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int8, Int16, Int64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_8")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, Int16, Int64>>(), [])
            @Expect("assertion#7110: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_8")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7111: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int8, Int16, Int64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_8")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, Int16, Int64>>(), [1i8, 114.514000f64])
            @Expect("assertion#7112: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_8")[0i64]
                .apply(TypeInfo.of<Int64>(), [1i8, 114.514000f64])
            @Expect("assertion#7113: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int8, Int16, Int64> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_8")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, Int16, Int64>>(), [114.514000f64])
            @Expect("assertion#7114: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_8")[0i64]
                .apply(TypeInfo.of<Int64>(), [114.514000f64])
            @Expect("assertion#7115: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int8, Int16, Int64> got.")
        }
        // logger.info("testcase TestCase_225 ends.")
    }

    @TestCase
    func TestCase_226(): Unit {
        // logger.info("testcase TestCase_226 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Float32, Float32, Int16>>().getStaticFunctions("classStaticMemberFunction_9").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_9")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float32, Int16>>(), [], [114.514000f32])
            @Expect("assertion#7116: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_9")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [114.514000f32])
            @Expect("assertion#7117: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_9")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#7118: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_9")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float32, Int16>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7119: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_9")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float32, Int16>>(), [], [])
            @Expect("assertion#7120: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_9")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7121: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_9")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float32, Int16>>(), [], [114.514000f32, 114.514000f64])
            @Expect("assertion#7122: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_9")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [114.514000f32, 114.514000f64])
            @Expect("assertion#7123: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_9")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float32, Int16>>(), [], [()])
            @Expect("assertion#7124: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_9")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#7125: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Float32, Float32, Int16>>()
            .getStaticFunctions("classStaticMemberFunction_9")[0i64]
            .apply(TypeInfo.of<StandardClassType<Float32, Float32, Int16>>(), [114.514000f32])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_9")[0i64]
                .apply(TypeInfo.of<Int64>(), [114.514000f32])
            @Expect("assertion#7126: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float32, Float32, Int16> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_9")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float32, Int16>>(), [])
            @Expect("assertion#7127: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_9")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7128: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float32, Float32, Int16> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_9")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float32, Int16>>(), [])
            @Expect("assertion#7129: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_9")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7130: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float32, Float32, Int16> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_9")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float32, Int16>>(), [114.514000f32, 114.514000f64])
            @Expect("assertion#7131: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_9")[0i64]
                .apply(TypeInfo.of<Int64>(), [114.514000f32, 114.514000f64])
            @Expect("assertion#7132: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float32, Float32, Int16> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_9")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float32, Int16>>(), [()])
            @Expect("assertion#7133: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_9")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#7134: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float32, Float32, Int16> got.")
        }
        // logger.info("testcase TestCase_226 ends.")
    }

    @TestCase
    func TestCase_227(): Unit {
        // logger.info("testcase TestCase_227 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int8, Unit, UInt16>>().getStaticFunctions("classStaticMemberFunction_10").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_10")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, Unit, UInt16>>(), [], [1u16])
            @Expect("assertion#7135: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_10")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [1u16])
            @Expect("assertion#7136: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_10")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#7137: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_10")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, Unit, UInt16>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7138: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_10")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, Unit, UInt16>>(), [], [])
            @Expect("assertion#7139: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_10")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7140: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_10")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, Unit, UInt16>>(), [], [1u16, 114.514000f64])
            @Expect("assertion#7141: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_10")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [1u16, 114.514000f64])
            @Expect("assertion#7142: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_10")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, Unit, UInt16>>(), [], [114.514000f64])
            @Expect("assertion#7143: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_10")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [114.514000f64])
            @Expect("assertion#7144: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int8, Unit, UInt16>>()
            .getStaticFunctions("classStaticMemberFunction_10")[0i64]
            .apply(TypeInfo.of<StandardClassType<Int8, Unit, UInt16>>(), [1u16])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_10")[0i64]
                .apply(TypeInfo.of<Int64>(), [1u16])
            @Expect("assertion#7145: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int8, Unit, UInt16> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_10")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, Unit, UInt16>>(), [])
            @Expect("assertion#7146: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_10")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7147: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int8, Unit, UInt16> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_10")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, Unit, UInt16>>(), [])
            @Expect("assertion#7148: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_10")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7149: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int8, Unit, UInt16> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_10")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, Unit, UInt16>>(), [1u16, 114.514000f64])
            @Expect("assertion#7150: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_10")[0i64]
                .apply(TypeInfo.of<Int64>(), [1u16, 114.514000f64])
            @Expect("assertion#7151: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int8, Unit, UInt16> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_10")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, Unit, UInt16>>(), [114.514000f64])
            @Expect("assertion#7152: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_10")[0i64]
                .apply(TypeInfo.of<Int64>(), [114.514000f64])
            @Expect("assertion#7153: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int8, Unit, UInt16> got.")
        }
        // logger.info("testcase TestCase_227 ends.")
    }
}
