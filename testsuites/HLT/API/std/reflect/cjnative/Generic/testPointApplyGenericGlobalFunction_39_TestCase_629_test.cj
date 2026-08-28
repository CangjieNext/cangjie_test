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
class testPointApplyGenericGlobalFunction_39 {
    let packageInfo = PackageInfo.get("dependency")
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
}
