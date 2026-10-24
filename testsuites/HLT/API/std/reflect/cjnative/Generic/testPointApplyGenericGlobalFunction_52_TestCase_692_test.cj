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
class testPointApplyGenericGlobalFunction_52 {
    let packageInfo = PackageInfo.get("dependency")
    @TestCase
    func TestCase_692(): Unit {
        // logger.info("testcase TestCase_692 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_257")[0i64]
            .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [NonGenericStruct()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_257")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [NonGenericStruct()])
            @Expect("assertion#16447: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_257")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [NonGenericStruct()])
            @Expect("assertion#16448: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_257")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct()])
            @Expect("assertion#16449: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_257")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#16450: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 0.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_257")[0i64].apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#16451: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_257")[0i64].apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#16452: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_257")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16453: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_257")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#16454: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 0.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_257")[0i64].apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#16455: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_257")[0i64].apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#16456: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_257")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16457: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_257")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#16458: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_257")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#16459: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_257")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#16460: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_257")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#16461: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo
                .getFunctions("globalFunction_257")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#16462: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "Parameter type mismatch for generic function invocation.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_257")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#16463: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_257")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#16464: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_257")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#16465: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("testcase TestCase_692 ends.")
    }
}
