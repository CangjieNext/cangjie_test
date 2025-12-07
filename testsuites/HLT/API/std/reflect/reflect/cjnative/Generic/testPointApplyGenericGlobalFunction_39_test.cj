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
class testPointApplyGenericGlobalFunction_39 {
    let packageInfo = PackageInfo.get("dependency")
    @TestCase
    func TestCase_626(): Unit {
        // logger.info("testcase TestCase_626 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_191")[0i64]
            .apply([TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt64>()], [1u8])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_191")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<UInt64>()], [1u8])
            @Expect("assertion#15193: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_191")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [1u8])
            @Expect("assertion#15194: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_191")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [1u8])
            @Expect("assertion#15195: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_191")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#15196: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_191")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#15197: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_191")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15198: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_191")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15199: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_191")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#15200: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_191")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#15201: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_191")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15202: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_191")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15203: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_191")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt64>()], [1u8, 114.514000f64])
            @Expect("assertion#15204: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_191")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<UInt64>()], [1u8, 114.514000f64])
            @Expect("assertion#15205: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_191")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [1u8, 114.514000f64])
            @Expect("assertion#15206: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_191")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [1u8, 114.514000f64])
            @Expect("assertion#15207: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo
                .getFunctions("globalFunction_191")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt64>()], [114.514000f64])
            @Expect("assertion#15208: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_191")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<UInt64>()], [114.514000f64])
            @Expect("assertion#15209: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_191")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [114.514000f64])
            @Expect("assertion#15210: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_191")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [114.514000f64])
            @Expect("assertion#15211: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("testcase TestCase_626 ends.")
    }

    @TestCase
    func TestCase_627(): Unit {
        // logger.info("testcase TestCase_627 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_192")[0i64]
            .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [1u16])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_192")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [1u16])
            @Expect("assertion#15212: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_192")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int32>()], [1u16])
            @Expect("assertion#15213: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_192")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [1u16])
            @Expect("assertion#15214: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_192")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#15215: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_192")[0i64].apply([TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#15216: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_192")[0i64].apply([TypeInfo.of<Int64>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#15217: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_192")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15218: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_192")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#15219: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_192")[0i64].apply([TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#15220: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_192")[0i64].apply([TypeInfo.of<Int64>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#15221: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_192")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15222: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_192")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [1u16, 114.514000f64])
            @Expect("assertion#15223: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_192")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [1u16, 114.514000f64])
            @Expect("assertion#15224: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_192")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int32>()], [1u16, 114.514000f64])
            @Expect("assertion#15225: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_192")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [1u16, 114.514000f64])
            @Expect("assertion#15226: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo
                .getFunctions("globalFunction_192")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [114.514000f64])
            @Expect("assertion#15227: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_192")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [114.514000f64])
            @Expect("assertion#15228: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_192")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int32>()], [114.514000f64])
            @Expect("assertion#15229: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_192")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [114.514000f64])
            @Expect("assertion#15230: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("testcase TestCase_627 ends.")
    }

    @TestCase
    func TestCase_628(): Unit {
        // logger.info("testcase TestCase_628 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_193")[0i64]
            .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [1u32])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_193")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [1u32])
            @Expect("assertion#15231: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_193")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [1u32])
            @Expect("assertion#15232: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_193")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [1u32])
            @Expect("assertion#15233: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_193")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#15234: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_193")[0i64].apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#15235: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_193")[0i64].apply([TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#15236: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_193")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15237: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_193")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#15238: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_193")[0i64].apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#15239: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_193")[0i64].apply([TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#15240: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_193")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15241: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_193")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [1u32, 114.514000f64])
            @Expect("assertion#15242: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_193")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [1u32, 114.514000f64])
            @Expect("assertion#15243: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_193")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [1u32, 114.514000f64])
            @Expect("assertion#15244: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_193")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [1u32, 114.514000f64])
            @Expect("assertion#15245: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo
                .getFunctions("globalFunction_193")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [114.514000f64])
            @Expect("assertion#15246: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_193")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [114.514000f64])
            @Expect("assertion#15247: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_193")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [114.514000f64])
            @Expect("assertion#15248: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_193")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [114.514000f64])
            @Expect("assertion#15249: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("testcase TestCase_628 ends.")
    }

    @TestCase
    func TestCase_629(): Unit {
        // logger.info("testcase TestCase_629 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_194")[0i64]
            .apply([TypeInfo.of<Int16>(), TypeInfo.of<Bool>(), TypeInfo.of<Unit>()], [123u64])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_194")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Unit>()], [123u64])
            @Expect("assertion#15250: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_194")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Bool>()], [123u64])
            @Expect("assertion#15251: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_194")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [123u64])
            @Expect("assertion#15252: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_194")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Bool>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#15253: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_194")[0i64].apply([TypeInfo.of<Bool>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#15254: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_194")[0i64].apply([TypeInfo.of<Int16>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#15255: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_194")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15256: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_194")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Bool>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#15257: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_194")[0i64].apply([TypeInfo.of<Bool>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#15258: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_194")[0i64].apply([TypeInfo.of<Int16>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#15259: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_194")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15260: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_194")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Bool>(), TypeInfo.of<Unit>()], [123u64, 114.514000f64])
            @Expect("assertion#15261: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_194")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Unit>()], [123u64, 114.514000f64])
            @Expect("assertion#15262: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_194")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Bool>()], [123u64, 114.514000f64])
            @Expect("assertion#15263: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_194")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [123u64, 114.514000f64])
            @Expect("assertion#15264: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo
                .getFunctions("globalFunction_194")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Bool>(), TypeInfo.of<Unit>()], [114.514000f64])
            @Expect("assertion#15265: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_194")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Unit>()], [114.514000f64])
            @Expect("assertion#15266: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_194")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Bool>()], [114.514000f64])
            @Expect("assertion#15267: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_194")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [114.514000f64])
            @Expect("assertion#15268: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("testcase TestCase_629 ends.")
    }

    @TestCase
    func TestCase_630(): Unit {
        // logger.info("testcase TestCase_630 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_195")[0i64]
            .apply([TypeInfo.of<Int8>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()], [114.514000f32])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_195")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()], [114.514000f32])
            @Expect("assertion#15269: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_195")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [114.514000f32])
            @Expect("assertion#15270: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_195")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [114.514000f32])
            @Expect("assertion#15271: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_195")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#15272: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_195")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#15273: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_195")[0i64].apply([TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15274: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_195")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15275: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_195")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#15276: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_195")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#15277: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_195")[0i64].apply([TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15278: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_195")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15279: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_195")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()],
                    [114.514000f32, 114.514000f64])
            @Expect("assertion#15280: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_195")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()], [114.514000f32, 114.514000f64])
            @Expect("assertion#15281: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_195")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [114.514000f32, 114.514000f64])
            @Expect("assertion#15282: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_195")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [114.514000f32, 114.514000f64])
            @Expect("assertion#15283: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo
                .getFunctions("globalFunction_195")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#15284: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_195")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#15285: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_195")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#15286: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_195")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [()])
            @Expect("assertion#15287: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("testcase TestCase_630 ends.")
    }
}
