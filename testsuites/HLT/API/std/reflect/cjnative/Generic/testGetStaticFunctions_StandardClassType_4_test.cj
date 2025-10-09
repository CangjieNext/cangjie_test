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
class testGetStaticFunctions_StandardClassType_4 {
    @TestCase
    func TestCase_233(): Unit {
        // logger.info("testcase TestCase_233 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int16, UInt16, UInt8>>().getStaticFunctions("classStaticMemberFunction_16").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt16, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_16")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, UInt16, UInt8>>(), [], [NonGenericClass()])
            @Expect("assertion#7249: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt16, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_16")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [NonGenericClass()])
            @Expect("assertion#7250: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt16, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_16")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#7251: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt16, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_16")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, UInt16, UInt8>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7252: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt16, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_16")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, UInt16, UInt8>>(), [], [])
            @Expect("assertion#7253: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt16, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_16")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7254: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt16, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_16")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, UInt16, UInt8>>(), [], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#7255: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt16, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_16")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#7256: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt16, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_16")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, UInt16, UInt8>>(), [], [()])
            @Expect("assertion#7257: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt16, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_16")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#7258: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int16, UInt16, UInt8>>()
            .getStaticFunctions("classStaticMemberFunction_16")[0i64]
            .apply(TypeInfo.of<StandardClassType<Int16, UInt16, UInt8>>(), [NonGenericClass()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt16, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_16")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass()])
            @Expect("assertion#7259: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, UInt16, UInt8> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt16, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_16")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, UInt16, UInt8>>(), [])
            @Expect("assertion#7260: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt16, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_16")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7261: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, UInt16, UInt8> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt16, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_16")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, UInt16, UInt8>>(), [])
            @Expect("assertion#7262: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt16, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_16")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7263: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, UInt16, UInt8> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt16, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_16")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, UInt16, UInt8>>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#7264: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt16, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_16")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#7265: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, UInt16, UInt8> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt16, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_16")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, UInt16, UInt8>>(), [()])
            @Expect("assertion#7266: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt16, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_16")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#7267: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, UInt16, UInt8> got.")
        }
        // logger.info("testcase TestCase_233 ends.")
    }

    @TestCase
    func TestCase_234(): Unit {
        // logger.info("testcase TestCase_234 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int64, Float32, Float64>>().getStaticFunctions("classStaticMemberFunction_17").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_17")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float32, Float64>>(), [],
                    [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#7268: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_17")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#7269: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_17")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#7270: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_17")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float32, Float64>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7271: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_17")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float32, Float64>>(), [], [])
            @Expect("assertion#7272: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_17")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7273: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_17")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float32, Float64>>(), [],
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#7274: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_17")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#7275: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_17")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float32, Float64>>(), [], [()])
            @Expect("assertion#7276: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_17")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#7277: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int64, Float32, Float64>>()
            .getStaticFunctions("classStaticMemberFunction_17")[0i64]
            .apply(TypeInfo.of<StandardClassType<Int64, Float32, Float64>>(), [GenericClassWith1TypeParameters<Int64>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_17")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#7278: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, Float32, Float64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_17")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float32, Float64>>(), [])
            @Expect("assertion#7279: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_17")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7280: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, Float32, Float64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_17")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float32, Float64>>(), [])
            @Expect("assertion#7281: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_17")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7282: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, Float32, Float64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_17")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float32, Float64>>(),
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#7283: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_17")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#7284: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, Float32, Float64> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_17")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float32, Float64>>(), [()])
            @Expect("assertion#7285: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_17")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#7286: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, Float32, Float64> got.")
        }
        // logger.info("testcase TestCase_234 ends.")
    }

    @TestCase
    func TestCase_235(): Unit {
        // logger.info("testcase TestCase_235 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Unit, Unit, Int16>>().getStaticFunctions("classStaticMemberFunction_18").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_18")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Unit, Int16>>(), [],
                    [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#7287: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_18")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#7288: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_18")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#7289: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_18")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Unit, Int16>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7290: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_18")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Unit, Int16>>(), [], [])
            @Expect("assertion#7291: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_18")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7292: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_18")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Unit, Int16>>(), [],
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#7293: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_18")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#7294: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_18")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Unit, Int16>>(), [], [()])
            @Expect("assertion#7295: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_18")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#7296: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Unit, Unit, Int16>>()
            .getStaticFunctions("classStaticMemberFunction_18")[0i64]
            .apply(TypeInfo.of<StandardClassType<Unit, Unit, Int16>>(), [GenericClassWith1TypeParameters<Bool>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_18")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#7297: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Unit, Unit, Int16> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_18")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Unit, Int16>>(), [])
            @Expect("assertion#7298: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_18")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7299: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Unit, Unit, Int16> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_18")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Unit, Int16>>(), [])
            @Expect("assertion#7300: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_18")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7301: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Unit, Unit, Int16> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_18")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Unit, Int16>>(),
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#7302: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_18")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#7303: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Unit, Unit, Int16> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_18")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Unit, Int16>>(), [()])
            @Expect("assertion#7304: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_18")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#7305: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Unit, Unit, Int16> got.")
        }
        // logger.info("testcase TestCase_235 ends.")
    }

    @TestCase
    func TestCase_236(): Unit {
        // logger.info("testcase TestCase_236 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>().getStaticFunctions("classStaticMemberFunction_19").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_19")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>(), [],
                    [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#7306: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_19")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#7307: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_19")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#7308: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_19")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7309: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_19")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>(), [], [])
            @Expect("assertion#7310: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_19")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7311: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_19")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>(), [],
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#7312: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_19")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#7313: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_19")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>(), [], [()])
            @Expect("assertion#7314: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_19")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#7315: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt32, UInt8, Float64>>()
            .getStaticFunctions("classStaticMemberFunction_19")[0i64]
            .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>(), [GenericClassWith1TypeParameters<Unit>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_19")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#7316: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, UInt8, Float64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_19")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>(), [])
            @Expect("assertion#7317: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_19")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7318: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, UInt8, Float64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_19")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>(), [])
            @Expect("assertion#7319: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_19")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7320: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, UInt8, Float64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_19")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>(),
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#7321: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_19")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#7322: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, UInt8, Float64> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_19")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>(), [()])
            @Expect("assertion#7323: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_19")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#7324: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, UInt8, Float64> got.")
        }
        // logger.info("testcase TestCase_236 ends.")
    }

    @TestCase
    func TestCase_237(): Unit {
        // logger.info("testcase TestCase_237 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt64, UInt32, UInt16>>().getStaticFunctions("classStaticMemberFunction_20").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_20")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt32, UInt16>>(), [],
                    [GenericClassWith1TypeParameters<UInt64>()])
            @Expect("assertion#7325: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_20")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<UInt64>()])
            @Expect("assertion#7326: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_20")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#7327: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_20")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt32, UInt16>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7328: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_20")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt32, UInt16>>(), [], [])
            @Expect("assertion#7329: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_20")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7330: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_20")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt32, UInt16>>(), [],
                    [GenericClassWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#7331: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_20")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericClassWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#7332: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_20")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt32, UInt16>>(), [], [()])
            @Expect("assertion#7333: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_20")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#7334: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt64, UInt32, UInt16>>()
            .getStaticFunctions("classStaticMemberFunction_20")[0i64]
            .apply(TypeInfo.of<StandardClassType<UInt64, UInt32, UInt16>>(), [GenericClassWith1TypeParameters<UInt64>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_20")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<UInt64>()])
            @Expect("assertion#7335: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, UInt32, UInt16> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_20")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt32, UInt16>>(), [])
            @Expect("assertion#7336: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_20")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7337: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, UInt32, UInt16> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_20")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt32, UInt16>>(), [])
            @Expect("assertion#7338: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_20")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7339: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, UInt32, UInt16> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_20")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt32, UInt16>>(),
                    [GenericClassWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#7340: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_20")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#7341: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, UInt32, UInt16> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_20")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt32, UInt16>>(), [()])
            @Expect("assertion#7342: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_20")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#7343: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, UInt32, UInt16> got.")
        }
        // logger.info("testcase TestCase_237 ends.")
    }
}
