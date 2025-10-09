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
class testPointApplyGenericGlobalFunction_37 {
    let packageInfo = PackageInfo.get("dependency")
    @TestCase
    func TestCase_616(): Unit {
        // logger.info("testcase TestCase_616 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_181")[0i64]
            .apply([TypeInfo.of<UInt32>()], [GenericStructWith2TypeParameters<UInt64, UInt64>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_181")[0i64]
                .apply([], [GenericStructWith2TypeParameters<UInt64, UInt64>()])
            @Expect("assertion#15003: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_181")[0i64]
                .apply([], [GenericStructWith2TypeParameters<UInt64, UInt64>()])
            @Expect("assertion#15004: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_181")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<UInt64, UInt64>()])
            @Expect("assertion#15005: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_181")[0i64].apply([TypeInfo.of<UInt32>()], [])
            @Expect("assertion#15006: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_181")[0i64].apply([], [])
            @Expect("assertion#15007: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_181")[0i64].apply([], [])
            @Expect("assertion#15008: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_181")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15009: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_181")[0i64].apply([TypeInfo.of<UInt32>()], [])
            @Expect("assertion#15010: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_181")[0i64].apply([], [])
            @Expect("assertion#15011: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_181")[0i64].apply([], [])
            @Expect("assertion#15012: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_181")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15013: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_181")[0i64]
                .apply([TypeInfo.of<UInt32>()], [GenericStructWith2TypeParameters<UInt64, UInt64>(), 114.514000f64])
            @Expect("assertion#15014: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_181")[0i64]
                .apply([], [GenericStructWith2TypeParameters<UInt64, UInt64>(), 114.514000f64])
            @Expect("assertion#15015: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_181")[0i64]
                .apply([], [GenericStructWith2TypeParameters<UInt64, UInt64>(), 114.514000f64])
            @Expect("assertion#15016: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_181")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<UInt64, UInt64>(), 114.514000f64])
            @Expect("assertion#15017: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo.getFunctions("globalFunction_181")[0i64].apply([TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#15018: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_181")[0i64].apply([], [()])
            @Expect("assertion#15019: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_181")[0i64].apply([], [()])
            @Expect("assertion#15020: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_181")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#15021: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("testcase TestCase_616 ends.")
    }

    @TestCase
    func TestCase_617(): Unit {
        // logger.info("testcase TestCase_617 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_182")[0i64]
            .apply([TypeInfo.of<Int8>()], [GenericStructWith2TypeParameters<Float32, Float32>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_182")[0i64]
                .apply([], [GenericStructWith2TypeParameters<Float32, Float32>()])
            @Expect("assertion#15022: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_182")[0i64]
                .apply([], [GenericStructWith2TypeParameters<Float32, Float32>()])
            @Expect("assertion#15023: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_182")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Float32, Float32>()])
            @Expect("assertion#15024: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_182")[0i64].apply([TypeInfo.of<Int8>()], [])
            @Expect("assertion#15025: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_182")[0i64].apply([], [])
            @Expect("assertion#15026: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_182")[0i64].apply([], [])
            @Expect("assertion#15027: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_182")[0i64].apply([TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15028: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_182")[0i64].apply([TypeInfo.of<Int8>()], [])
            @Expect("assertion#15029: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_182")[0i64].apply([], [])
            @Expect("assertion#15030: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_182")[0i64].apply([], [])
            @Expect("assertion#15031: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_182")[0i64].apply([TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15032: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_182")[0i64]
                .apply([TypeInfo.of<Int8>()], [GenericStructWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#15033: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_182")[0i64]
                .apply([], [GenericStructWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#15034: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_182")[0i64]
                .apply([], [GenericStructWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#15035: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_182")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#15036: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo.getFunctions("globalFunction_182")[0i64].apply([TypeInfo.of<Int8>()], [()])
            @Expect("assertion#15037: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_182")[0i64].apply([], [()])
            @Expect("assertion#15038: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_182")[0i64].apply([], [()])
            @Expect("assertion#15039: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_182")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#15040: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("testcase TestCase_617 ends.")
    }

    @TestCase
    func TestCase_618(): Unit {
        // logger.info("testcase TestCase_618 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_183")[0i64]
            .apply([TypeInfo.of<UInt32>()], [GenericStructWith2TypeParameters<Float64, Float64>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_183")[0i64]
                .apply([], [GenericStructWith2TypeParameters<Float64, Float64>()])
            @Expect("assertion#15041: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_183")[0i64]
                .apply([], [GenericStructWith2TypeParameters<Float64, Float64>()])
            @Expect("assertion#15042: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_183")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Float64, Float64>()])
            @Expect("assertion#15043: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_183")[0i64].apply([TypeInfo.of<UInt32>()], [])
            @Expect("assertion#15044: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_183")[0i64].apply([], [])
            @Expect("assertion#15045: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_183")[0i64].apply([], [])
            @Expect("assertion#15046: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_183")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15047: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_183")[0i64].apply([TypeInfo.of<UInt32>()], [])
            @Expect("assertion#15048: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_183")[0i64].apply([], [])
            @Expect("assertion#15049: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_183")[0i64].apply([], [])
            @Expect("assertion#15050: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_183")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15051: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_183")[0i64]
                .apply([TypeInfo.of<UInt32>()], [GenericStructWith2TypeParameters<Float64, Float64>(), 114.514000f64])
            @Expect("assertion#15052: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_183")[0i64]
                .apply([], [GenericStructWith2TypeParameters<Float64, Float64>(), 114.514000f64])
            @Expect("assertion#15053: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_183")[0i64]
                .apply([], [GenericStructWith2TypeParameters<Float64, Float64>(), 114.514000f64])
            @Expect("assertion#15054: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_183")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Float64, Float64>(), 114.514000f64])
            @Expect("assertion#15055: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo.getFunctions("globalFunction_183")[0i64].apply([TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#15056: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_183")[0i64].apply([], [()])
            @Expect("assertion#15057: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_183")[0i64].apply([], [()])
            @Expect("assertion#15058: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_183")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#15059: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("testcase TestCase_618 ends.")
    }

    @TestCase
    func TestCase_619(): Unit {
        // logger.info("testcase TestCase_619 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_184")[0i64]
            .apply([TypeInfo.of<UInt16>()], [GenericStructWith2TypeParameters<UInt16, UInt16>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_184")[0i64]
                .apply([], [GenericStructWith2TypeParameters<UInt16, UInt16>()])
            @Expect("assertion#15060: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_184")[0i64]
                .apply([], [GenericStructWith2TypeParameters<UInt16, UInt16>()])
            @Expect("assertion#15061: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_184")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<UInt16, UInt16>()])
            @Expect("assertion#15062: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_184")[0i64].apply([TypeInfo.of<UInt16>()], [])
            @Expect("assertion#15063: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_184")[0i64].apply([], [])
            @Expect("assertion#15064: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_184")[0i64].apply([], [])
            @Expect("assertion#15065: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_184")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15066: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_184")[0i64].apply([TypeInfo.of<UInt16>()], [])
            @Expect("assertion#15067: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_184")[0i64].apply([], [])
            @Expect("assertion#15068: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_184")[0i64].apply([], [])
            @Expect("assertion#15069: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_184")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15070: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_184")[0i64]
                .apply([TypeInfo.of<UInt16>()], [GenericStructWith2TypeParameters<UInt16, UInt16>(), 114.514000f64])
            @Expect("assertion#15071: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_184")[0i64]
                .apply([], [GenericStructWith2TypeParameters<UInt16, UInt16>(), 114.514000f64])
            @Expect("assertion#15072: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_184")[0i64]
                .apply([], [GenericStructWith2TypeParameters<UInt16, UInt16>(), 114.514000f64])
            @Expect("assertion#15073: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_184")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<UInt16, UInt16>(), 114.514000f64])
            @Expect("assertion#15074: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo.getFunctions("globalFunction_184")[0i64].apply([TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#15075: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_184")[0i64].apply([], [()])
            @Expect("assertion#15076: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_184")[0i64].apply([], [()])
            @Expect("assertion#15077: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_184")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#15078: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("testcase TestCase_619 ends.")
    }

    @TestCase
    func TestCase_620(): Unit {
        // logger.info("testcase TestCase_620 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_185")[0i64]
            .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int32>(), TypeInfo.of<Int16>()], [()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_185")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#15079: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_185")[0i64].apply([TypeInfo.of<Bool>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#15080: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_185")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#15081: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_185")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int32>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#15082: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_185")[0i64].apply([TypeInfo.of<Int32>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#15083: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_185")[0i64].apply([TypeInfo.of<Bool>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#15084: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_185")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15085: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_185")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int32>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#15086: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_185")[0i64].apply([TypeInfo.of<Int32>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#15087: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_185")[0i64].apply([TypeInfo.of<Bool>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#15088: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_185")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15089: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_185")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int32>(), TypeInfo.of<Int16>()], [(), 114.514000f64])
            @Expect("assertion#15090: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_185")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Int16>()], [(), 114.514000f64])
            @Expect("assertion#15091: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_185")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int32>()], [(), 114.514000f64])
            @Expect("assertion#15092: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_185")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [(), 114.514000f64])
            @Expect("assertion#15093: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo
                .getFunctions("globalFunction_185")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int32>(), TypeInfo.of<Int16>()], [123i64])
            @Expect("assertion#15094: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_185")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Int16>()], [123i64])
            @Expect("assertion#15095: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_185")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int32>()], [123i64])
            @Expect("assertion#15096: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_185")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [123i64])
            @Expect("assertion#15097: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("testcase TestCase_620 ends.")
    }
}
