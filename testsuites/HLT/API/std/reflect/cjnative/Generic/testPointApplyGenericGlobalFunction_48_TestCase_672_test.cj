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
    func TestCase_672(): Unit {
        // logger.info("testcase TestCase_672 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_237")[0i64]
            .apply([TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()],
                [GenericClassWith2TypeParameters<UInt16, UInt16>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_237")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()],
                    [GenericClassWith2TypeParameters<UInt16, UInt16>()])
            @Expect("assertion#16067: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_237")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<UInt16>()], [GenericClassWith2TypeParameters<UInt16, UInt16>()])
            @Expect("assertion#16068: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_237")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<UInt16, UInt16>()])
            @Expect("assertion#16069: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_237")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#16070: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_237")[0i64].apply([TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#16071: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_237")[0i64].apply([TypeInfo.of<Bool>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#16072: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_237")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16073: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_237")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#16074: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_237")[0i64].apply([TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#16075: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_237")[0i64].apply([TypeInfo.of<Bool>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#16076: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_237")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16077: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_237")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()],
                    [GenericClassWith2TypeParameters<UInt16, UInt16>(), 114.514000f64])
            @Expect("assertion#16078: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_237")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()],
                    [GenericClassWith2TypeParameters<UInt16, UInt16>(), 114.514000f64])
            @Expect("assertion#16079: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_237")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<UInt16>()],
                    [GenericClassWith2TypeParameters<UInt16, UInt16>(), 114.514000f64])
            @Expect("assertion#16080: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_237")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<UInt16, UInt16>(), 114.514000f64])
            @Expect("assertion#16081: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo
                .getFunctions("globalFunction_237")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#16082: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_237")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#16083: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_237")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#16084: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_237")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#16085: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("testcase TestCase_672 ends.")
    }
}
