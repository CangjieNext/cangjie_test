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
class testPointApplyGenericGlobalFunction_38 {
    let packageInfo = PackageInfo.get("dependency")
    @TestCase
    func TestCase_624(): Unit {
        // logger.info("testcase TestCase_624 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_189")[0i64]
            .apply([TypeInfo.of<UInt32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [1i32])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_189")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [1i32])
            @Expect("assertion#15155: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_189")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<UInt8>()], [1i32])
            @Expect("assertion#15156: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_189")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [1i32])
            @Expect("assertion#15157: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_189")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#15158: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_189")[0i64].apply([TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#15159: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_189")[0i64].apply([TypeInfo.of<UInt32>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#15160: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_189")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15161: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_189")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#15162: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_189")[0i64].apply([TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#15163: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_189")[0i64].apply([TypeInfo.of<UInt32>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#15164: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_189")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15165: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_189")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [1i32, 114.514000f64])
            @Expect("assertion#15166: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_189")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [1i32, 114.514000f64])
            @Expect("assertion#15167: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_189")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<UInt8>()], [1i32, 114.514000f64])
            @Expect("assertion#15168: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_189")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [1i32, 114.514000f64])
            @Expect("assertion#15169: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo
                .getFunctions("globalFunction_189")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [114.514000f64])
            @Expect("assertion#15170: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_189")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [114.514000f64])
            @Expect("assertion#15171: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_189")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<UInt8>()], [114.514000f64])
            @Expect("assertion#15172: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_189")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [114.514000f64])
            @Expect("assertion#15173: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("testcase TestCase_624 ends.")
    }
}
