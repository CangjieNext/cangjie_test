/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
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
class testPointApplyGenericGlobalFunction_1 {
    let packageInfo = PackageInfo.get("dependency")
    @TestCase
    func TestCase_438(): Unit {
        // logger.info("testcase TestCase_438 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_3")[0i64]
            .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt16>()], [])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_3")[0i64].apply([TypeInfo.of<Int8>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#12387: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_3")[0i64].apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#12388: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_3")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#12389: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_3")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt16>()], [114.514000f64])
            @Expect("assertion#12390: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_3")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<UInt16>()], [114.514000f64])
            @Expect("assertion#12391: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_3")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [114.514000f64])
            @Expect("assertion#12392: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_3")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [114.514000f64])
            @Expect("assertion#12393: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("testcase TestCase_438 ends.")
    }
}
