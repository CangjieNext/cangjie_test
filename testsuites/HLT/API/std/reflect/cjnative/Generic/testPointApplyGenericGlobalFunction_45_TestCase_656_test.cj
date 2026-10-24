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
class testPointApplyGenericGlobalFunction_45 {
    let packageInfo = PackageInfo.get("dependency")
    @TestCase
    func TestCase_656(): Unit {
        // logger.info("testcase TestCase_656 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_221")[0i64]
            .apply([TypeInfo.of<Float64>(), TypeInfo.of<Int8>(), TypeInfo.of<Unit>()],
                [GenericClassWith1TypeParameters<UInt8>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_221")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Unit>()], [GenericClassWith1TypeParameters<UInt8>()])
            @Expect("assertion#15763: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_221")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Int8>()], [GenericClassWith1TypeParameters<UInt8>()])
            @Expect("assertion#15764: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_221")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Int8>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<UInt8>()])
            @Expect("assertion#15765: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_221")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Int8>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#15766: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 0.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_221")[0i64].apply([TypeInfo.of<Int8>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#15767: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_221")[0i64].apply([TypeInfo.of<Float64>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#15768: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_221")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Int8>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15769: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_221")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Int8>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#15770: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 0.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_221")[0i64].apply([TypeInfo.of<Int8>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#15771: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_221")[0i64].apply([TypeInfo.of<Float64>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#15772: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_221")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Int8>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15773: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_221")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Int8>(), TypeInfo.of<Unit>()],
                    [GenericClassWith1TypeParameters<UInt8>(), 114.514000f64])
            @Expect("assertion#15774: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_221")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Unit>()],
                    [GenericClassWith1TypeParameters<UInt8>(), 114.514000f64])
            @Expect("assertion#15775: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_221")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Int8>()],
                    [GenericClassWith1TypeParameters<UInt8>(), 114.514000f64])
            @Expect("assertion#15776: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_221")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Int8>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<UInt8>(), 114.514000f64])
            @Expect("assertion#15777: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo
                .getFunctions("globalFunction_221")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Int8>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#15778: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "Parameter type mismatch for generic function invocation.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_221")[0i64].apply([TypeInfo.of<Int8>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#15779: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_221")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#15780: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_221")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Int8>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#15781: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("testcase TestCase_656 ends.")
    }
}
