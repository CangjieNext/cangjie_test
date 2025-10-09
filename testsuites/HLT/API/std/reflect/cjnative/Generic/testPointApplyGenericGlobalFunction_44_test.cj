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
class testPointApplyGenericGlobalFunction_44 {
    let packageInfo = PackageInfo.get("dependency")
    @TestCase
    func TestCase_651(): Unit {
        // logger.info("testcase TestCase_651 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_216")[0i64]
            .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()],
                [GenericClassWith1TypeParameters<Bool>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_216")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#15668: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_216")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int64>()], [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#15669: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_216")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#15670: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_216")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#15671: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_216")[0i64].apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#15672: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_216")[0i64].apply([TypeInfo.of<Int64>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#15673: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_216")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15674: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_216")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#15675: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_216")[0i64].apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#15676: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_216")[0i64].apply([TypeInfo.of<Int64>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#15677: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_216")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15678: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_216")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()],
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#15679: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_216")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()],
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#15680: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_216")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int64>()],
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#15681: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_216")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#15682: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo
                .getFunctions("globalFunction_216")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#15683: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_216")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#15684: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_216")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#15685: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_216")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#15686: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("testcase TestCase_651 ends.")
    }

    @TestCase
    func TestCase_652(): Unit {
        // logger.info("testcase TestCase_652 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_217")[0i64]
            .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int16>(), TypeInfo.of<Int32>()],
                [GenericClassWith1TypeParameters<Int8>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_217")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int32>()], [GenericClassWith1TypeParameters<Int8>()])
            @Expect("assertion#15687: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_217")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int16>()], [GenericClassWith1TypeParameters<Int8>()])
            @Expect("assertion#15688: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_217")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Int8>()])
            @Expect("assertion#15689: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_217")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int16>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#15690: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_217")[0i64].apply([TypeInfo.of<Int16>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#15691: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_217")[0i64].apply([TypeInfo.of<Bool>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#15692: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_217")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15693: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_217")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int16>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#15694: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_217")[0i64].apply([TypeInfo.of<Int16>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#15695: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_217")[0i64].apply([TypeInfo.of<Bool>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#15696: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_217")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15697: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_217")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int16>(), TypeInfo.of<Int32>()],
                    [GenericClassWith1TypeParameters<Int8>(), 114.514000f64])
            @Expect("assertion#15698: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_217")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int32>()],
                    [GenericClassWith1TypeParameters<Int8>(), 114.514000f64])
            @Expect("assertion#15699: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_217")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int16>()],
                    [GenericClassWith1TypeParameters<Int8>(), 114.514000f64])
            @Expect("assertion#15700: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_217")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Int8>(), 114.514000f64])
            @Expect("assertion#15701: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo
                .getFunctions("globalFunction_217")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int16>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#15702: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_217")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#15703: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_217")[0i64].apply([TypeInfo.of<Bool>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#15704: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_217")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#15705: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("testcase TestCase_652 ends.")
    }

    @TestCase
    func TestCase_653(): Unit {
        // logger.info("testcase TestCase_653 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_218")[0i64]
            .apply([TypeInfo.of<Int8>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt32>()],
                [GenericClassWith1TypeParameters<Int16>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_218")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<UInt32>()], [GenericClassWith1TypeParameters<Int16>()])
            @Expect("assertion#15706: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_218")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Bool>()], [GenericClassWith1TypeParameters<Int16>()])
            @Expect("assertion#15707: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_218")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Int16>()])
            @Expect("assertion#15708: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_218")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#15709: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_218")[0i64].apply([TypeInfo.of<Bool>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#15710: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_218")[0i64].apply([TypeInfo.of<Int8>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#15711: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_218")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15712: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_218")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#15713: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_218")[0i64].apply([TypeInfo.of<Bool>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#15714: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_218")[0i64].apply([TypeInfo.of<Int8>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#15715: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_218")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15716: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_218")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt32>()],
                    [GenericClassWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#15717: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_218")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<UInt32>()],
                    [GenericClassWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#15718: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_218")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Bool>()],
                    [GenericClassWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#15719: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_218")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#15720: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo
                .getFunctions("globalFunction_218")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#15721: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_218")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#15722: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_218")[0i64].apply([TypeInfo.of<Int8>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#15723: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_218")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#15724: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("testcase TestCase_653 ends.")
    }

    @TestCase
    func TestCase_654(): Unit {
        // logger.info("testcase TestCase_654 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_219")[0i64]
            .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int64>(), TypeInfo.of<Int32>()],
                [GenericClassWith1TypeParameters<Int32>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_219")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int32>()], [GenericClassWith1TypeParameters<Int32>()])
            @Expect("assertion#15725: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_219")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int64>()], [GenericClassWith1TypeParameters<Int32>()])
            @Expect("assertion#15726: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_219")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Int32>()])
            @Expect("assertion#15727: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_219")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int64>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#15728: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_219")[0i64].apply([TypeInfo.of<Int64>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#15729: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_219")[0i64].apply([TypeInfo.of<Bool>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#15730: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_219")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15731: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_219")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int64>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#15732: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_219")[0i64].apply([TypeInfo.of<Int64>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#15733: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_219")[0i64].apply([TypeInfo.of<Bool>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#15734: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_219")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15735: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_219")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int64>(), TypeInfo.of<Int32>()],
                    [GenericClassWith1TypeParameters<Int32>(), 114.514000f64])
            @Expect("assertion#15736: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_219")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int32>()],
                    [GenericClassWith1TypeParameters<Int32>(), 114.514000f64])
            @Expect("assertion#15737: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_219")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int64>()],
                    [GenericClassWith1TypeParameters<Int32>(), 114.514000f64])
            @Expect("assertion#15738: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_219")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Int32>(), 114.514000f64])
            @Expect("assertion#15739: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo
                .getFunctions("globalFunction_219")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int64>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#15740: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_219")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#15741: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_219")[0i64].apply([TypeInfo.of<Bool>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#15742: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_219")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#15743: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("testcase TestCase_654 ends.")
    }

    @TestCase
    func TestCase_655(): Unit {
        // logger.info("testcase TestCase_655 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_220")[0i64]
            .apply([TypeInfo.of<Int8>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()],
                [GenericClassWith1TypeParameters<Int64>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_220")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()], [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#15744: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_220")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Unit>()], [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#15745: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_220")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#15746: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_220")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#15747: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_220")[0i64].apply([TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#15748: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_220")[0i64].apply([TypeInfo.of<Int8>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#15749: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_220")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15750: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_220")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#15751: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_220")[0i64].apply([TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#15752: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_220")[0i64].apply([TypeInfo.of<Int8>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#15753: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_220")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15754: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_220")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()],
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#15755: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_220")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()],
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#15756: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_220")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Unit>()],
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#15757: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_220")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#15758: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo
                .getFunctions("globalFunction_220")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#15759: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_220")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#15760: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_220")[0i64].apply([TypeInfo.of<Int8>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#15761: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_220")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#15762: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("testcase TestCase_655 ends.")
    }
}
