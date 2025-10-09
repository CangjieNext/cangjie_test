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
class testGetStaticFunctions_StandardStructType_5 {
    @TestCase
    func TestCase_347(): Unit {
        // logger.info("testcase TestCase_347 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt64, Int16, Int8>>().getStaticFunctions("classStaticMemberFunction_130").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_130")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Int16, Int8>>(), [],
                    [GenericClassWith1TypeParameters<Int16>()])
            @Expect("assertion#10055: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_130")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<Int16>()])
            @Expect("assertion#10056: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_130")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#10057: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_130")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Int16, Int8>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10058: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_130")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Int16, Int8>>(), [], [])
            @Expect("assertion#10059: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_130")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10060: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_130")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Int16, Int8>>(), [],
                    [GenericClassWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#10061: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_130")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericClassWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#10062: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_130")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Int16, Int8>>(), [], [()])
            @Expect("assertion#10063: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_130")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#10064: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt64, Int16, Int8>>()
            .getStaticFunctions("classStaticMemberFunction_130")[0i64]
            .apply(TypeInfo.of<StandardStructType<UInt64, Int16, Int8>>(), [GenericClassWith1TypeParameters<Int16>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_130")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Int16>()])
            @Expect("assertion#10065: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, Int16, Int8> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_130")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Int16, Int8>>(), [])
            @Expect("assertion#10066: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_130")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10067: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, Int16, Int8> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_130")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Int16, Int8>>(), [])
            @Expect("assertion#10068: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_130")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10069: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, Int16, Int8> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_130")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Int16, Int8>>(),
                    [GenericClassWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#10070: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_130")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#10071: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, Int16, Int8> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_130")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Int16, Int8>>(), [()])
            @Expect("assertion#10072: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_130")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#10073: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, Int16, Int8> got.")
        }
        // logger.info("testcase TestCase_347 ends.")
    }

    @TestCase
    func TestCase_348(): Unit {
        // logger.info("testcase TestCase_348 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Bool, UInt64, Unit>>().getStaticFunctions("classStaticMemberFunction_131").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_131")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt64, Unit>>(), [],
                    [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#10074: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_131")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#10075: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_131")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#10076: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_131")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt64, Unit>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10077: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_131")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt64, Unit>>(), [], [])
            @Expect("assertion#10078: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_131")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10079: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_131")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt64, Unit>>(), [],
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#10080: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_131")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#10081: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_131")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt64, Unit>>(), [], [()])
            @Expect("assertion#10082: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_131")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#10083: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Bool, UInt64, Unit>>()
            .getStaticFunctions("classStaticMemberFunction_131")[0i64]
            .apply(TypeInfo.of<StandardStructType<Bool, UInt64, Unit>>(), [GenericClassWith1TypeParameters<Unit>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_131")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#10084: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, UInt64, Unit> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_131")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt64, Unit>>(), [])
            @Expect("assertion#10085: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_131")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10086: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, UInt64, Unit> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_131")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt64, Unit>>(), [])
            @Expect("assertion#10087: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_131")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10088: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, UInt64, Unit> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_131")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt64, Unit>>(),
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#10089: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_131")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#10090: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, UInt64, Unit> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_131")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt64, Unit>>(), [()])
            @Expect("assertion#10091: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_131")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#10092: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, UInt64, Unit> got.")
        }
        // logger.info("testcase TestCase_348 ends.")
    }

    @TestCase
    func TestCase_349(): Unit {
        // logger.info("testcase TestCase_349 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Float64, Unit, Int8>>().getStaticFunctions("classStaticMemberFunction_132").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_132")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Unit, Int8>>(), [],
                    [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#10093: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_132")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#10094: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_132")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#10095: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_132")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Unit, Int8>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10096: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_132")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Unit, Int8>>(), [], [])
            @Expect("assertion#10097: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_132")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10098: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_132")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Unit, Int8>>(), [],
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#10099: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_132")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#10100: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_132")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Unit, Int8>>(), [], [()])
            @Expect("assertion#10101: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_132")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#10102: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Float64, Unit, Int8>>()
            .getStaticFunctions("classStaticMemberFunction_132")[0i64]
            .apply(TypeInfo.of<StandardStructType<Float64, Unit, Int8>>(),
                [GenericClassWith2TypeParameters<Int64, Int64>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_132")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#10103: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, Unit, Int8> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_132")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Unit, Int8>>(), [])
            @Expect("assertion#10104: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_132")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10105: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, Unit, Int8> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_132")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Unit, Int8>>(), [])
            @Expect("assertion#10106: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_132")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10107: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, Unit, Int8> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_132")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Unit, Int8>>(),
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#10108: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_132")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#10109: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, Unit, Int8> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_132")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Unit, Int8>>(), [()])
            @Expect("assertion#10110: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_132")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#10111: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, Unit, Int8> got.")
        }
        // logger.info("testcase TestCase_349 ends.")
    }

    @TestCase
    func TestCase_350(): Unit {
        // logger.info("testcase TestCase_350 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int64, Int64, Int64>>().getStaticFunctions("classStaticMemberFunction_133").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_133")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Int64>>(), [],
                    [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#10112: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_133")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#10113: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_133")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#10114: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_133")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Int64>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10115: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_133")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Int64>>(), [], [])
            @Expect("assertion#10116: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_133")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10117: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_133")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Int64>>(), [],
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#10118: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_133")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#10119: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_133")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Int64>>(), [], [()])
            @Expect("assertion#10120: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_133")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#10121: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int64, Int64, Int64>>()
            .getStaticFunctions("classStaticMemberFunction_133")[0i64]
            .apply(TypeInfo.of<StandardStructType<Int64, Int64, Int64>>(),
                [GenericClassWith2TypeParameters<Bool, Bool>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_133")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#10122: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int64, Int64, Int64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_133")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Int64>>(), [])
            @Expect("assertion#10123: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_133")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10124: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int64, Int64, Int64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_133")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Int64>>(), [])
            @Expect("assertion#10125: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_133")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10126: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int64, Int64, Int64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_133")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Int64>>(),
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#10127: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_133")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#10128: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int64, Int64, Int64> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_133")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Int64>>(), [()])
            @Expect("assertion#10129: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_133")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#10130: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int64, Int64, Int64> got.")
        }
        // logger.info("testcase TestCase_350 ends.")
    }

    @TestCase
    func TestCase_351(): Unit {
        // logger.info("testcase TestCase_351 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt16, Int16, Int8>>().getStaticFunctions("classStaticMemberFunction_134").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_134")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int16, Int8>>(), [],
                    [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#10131: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_134")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#10132: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_134")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#10133: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_134")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int16, Int8>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10134: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_134")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int16, Int8>>(), [], [])
            @Expect("assertion#10135: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_134")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10136: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_134")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int16, Int8>>(), [],
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#10137: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_134")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#10138: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_134")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int16, Int8>>(), [], [()])
            @Expect("assertion#10139: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_134")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#10140: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt16, Int16, Int8>>()
            .getStaticFunctions("classStaticMemberFunction_134")[0i64]
            .apply(TypeInfo.of<StandardStructType<UInt16, Int16, Int8>>(),
                [GenericClassWith2TypeParameters<Unit, Unit>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_134")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#10141: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, Int16, Int8> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_134")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int16, Int8>>(), [])
            @Expect("assertion#10142: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_134")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10143: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, Int16, Int8> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_134")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int16, Int8>>(), [])
            @Expect("assertion#10144: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_134")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10145: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, Int16, Int8> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_134")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int16, Int8>>(),
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#10146: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_134")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#10147: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, Int16, Int8> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_134")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int16, Int8>>(), [()])
            @Expect("assertion#10148: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_134")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#10149: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, Int16, Int8> got.")
        }
        // logger.info("testcase TestCase_351 ends.")
    }
}
