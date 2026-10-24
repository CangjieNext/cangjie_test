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
    func TestCase_621(): Unit {
        // logger.info("testcase TestCase_621 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_186")[0i64]
            .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Float32>(), TypeInfo.of<Bool>()], [true])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_186")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Bool>()], [true])
            @Expect("assertion#15098: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_186")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Float32>()], [true])
            @Expect("assertion#15099: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_186")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [true])
            @Expect("assertion#15100: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_186")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Float32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#15101: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 0.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_186")[0i64].apply([TypeInfo.of<Float32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#15102: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_186")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#15103: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_186")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15104: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_186")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Float32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#15105: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 0.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_186")[0i64].apply([TypeInfo.of<Float32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#15106: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_186")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#15107: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_186")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15108: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_186")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Float32>(), TypeInfo.of<Bool>()], [true, 114.514000f64])
            @Expect("assertion#15109: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_186")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Bool>()], [true, 114.514000f64])
            @Expect("assertion#15110: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_186")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Float32>()], [true, 114.514000f64])
            @Expect("assertion#15111: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_186")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [true, 114.514000f64])
            @Expect("assertion#15112: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo
                .getFunctions("globalFunction_186")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Float32>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#15113: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "Parameter type mismatch for generic function invocation.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_186")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#15114: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_186")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#15115: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_186")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [()])
            @Expect("assertion#15116: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("testcase TestCase_621 ends.")
    }
}
