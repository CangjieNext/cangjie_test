/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1 
// DEPENDENCE: dependency
// EXEC: %compiler %cmp_opt %compile_library dependency/*.cj -o libdependency.%library_suffix
// EXEC: %compiler %cmp_opt -L. -ldependency %f %cmp_utest_opt -o %output
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args  
package testsuite

import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*
import std.reflect.*
import dependency.*

@Test
class testPointApplyGenericGlobalFunction_48 {
    let packageInfo = PackageInfo.get("dependency")
    @TestCase
    func TestCase_673(): Unit {
        // logger.info("testcase TestCase_673 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_238")[0i64]
            .apply([TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>()],
                [GenericClassWith2TypeParameters<UInt32, UInt32>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_238")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Int8>()], [GenericClassWith2TypeParameters<UInt32, UInt32>()])
            @Expect("assertion#16086: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_238")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [GenericClassWith2TypeParameters<UInt32, UInt32>()])
            @Expect("assertion#16087: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_238")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<UInt32, UInt32>()])
            @Expect("assertion#16088: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_238")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#16089: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_238")[0i64].apply([TypeInfo.of<Unit>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#16090: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_238")[0i64].apply([TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#16091: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_238")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16092: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_238")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#16093: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_238")[0i64].apply([TypeInfo.of<Unit>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#16094: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_238")[0i64].apply([TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#16095: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_238")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16096: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_238")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>()],
                    [GenericClassWith2TypeParameters<UInt32, UInt32>(), 114.514000f64])
            @Expect("assertion#16097: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_238")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Int8>()],
                    [GenericClassWith2TypeParameters<UInt32, UInt32>(), 114.514000f64])
            @Expect("assertion#16098: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_238")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Unit>()],
                    [GenericClassWith2TypeParameters<UInt32, UInt32>(), 114.514000f64])
            @Expect("assertion#16099: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_238")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<UInt32, UInt32>(), 114.514000f64])
            @Expect("assertion#16100: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo
                .getFunctions("globalFunction_238")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#16101: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_238")[0i64].apply([TypeInfo.of<Unit>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#16102: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_238")[0i64].apply([TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#16103: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_238")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#16104: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("testcase TestCase_673 ends.")
    }
}
