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
class testPointApplyGenericGlobalFunction_44 {
    let packageInfo = PackageInfo.get("dependency")
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
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_219")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int64>()], [GenericClassWith1TypeParameters<Int32>()])
            @Expect("assertion#15726: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_219")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Int32>()])
            @Expect("assertion#15727: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_219")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int64>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#15728: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 0.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_219")[0i64].apply([TypeInfo.of<Int64>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#15729: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_219")[0i64].apply([TypeInfo.of<Bool>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#15730: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_219")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15731: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_219")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int64>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#15732: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 0.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_219")[0i64].apply([TypeInfo.of<Int64>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#15733: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_219")[0i64].apply([TypeInfo.of<Bool>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#15734: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_219")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15735: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_219")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int64>(), TypeInfo.of<Int32>()],
                    [GenericClassWith1TypeParameters<Int32>(), 114.514000f64])
            @Expect("assertion#15736: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_219")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int32>()],
                    [GenericClassWith1TypeParameters<Int32>(), 114.514000f64])
            @Expect("assertion#15737: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_219")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int64>()],
                    [GenericClassWith1TypeParameters<Int32>(), 114.514000f64])
            @Expect("assertion#15738: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_219")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Int32>(), 114.514000f64])
            @Expect("assertion#15739: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo
                .getFunctions("globalFunction_219")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int64>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#15740: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "Parameter type mismatch for generic function invocation.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_219")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#15741: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_219")[0i64].apply([TypeInfo.of<Bool>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#15742: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_219")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#15743: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("testcase TestCase_654 ends.")
    }
}
