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
class testPointApplyGenericGlobalFunction_2 {
    let packageInfo = PackageInfo.get("dependency")
    @TestCase
    func TestCase_444(): Unit {
        // logger.info("testcase TestCase_444 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_9")[0i64]
            .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float32>()],
                [1i16, NonGenericClass(), GenericClassWith2TypeParameters<Int8, Int8>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_9")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Float32>()],
                    [1i16, NonGenericClass(), GenericClassWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#12483: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_9")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int16>()],
                    [1i16, NonGenericClass(), GenericClassWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#12484: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_9")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [1i16, NonGenericClass(), GenericClassWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#12485: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_9")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float32>()],
                    [NonGenericClass(), GenericClassWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#12486: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_9")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Float32>()],
                    [NonGenericClass(), GenericClassWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#12487: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_9")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int16>()],
                    [NonGenericClass(), GenericClassWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#12488: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_9")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), GenericClassWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#12489: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_9")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float32>()], [1i16, NonGenericClass()])
            @Expect("assertion#12490: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_9")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Float32>()], [1i16, NonGenericClass()])
            @Expect("assertion#12491: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_9")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [1i16, NonGenericClass()])
            @Expect("assertion#12492: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_9")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [1i16, NonGenericClass()])
            @Expect("assertion#12493: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_9")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float32>()],
                    [1i16, NonGenericClass(), GenericClassWith2TypeParameters<Int8, Int8>(), 114.514000f64])
            @Expect("assertion#12494: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_9")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Float32>()],
                    [1i16, NonGenericClass(), GenericClassWith2TypeParameters<Int8, Int8>(), 114.514000f64])
            @Expect("assertion#12495: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_9")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int16>()],
                    [1i16, NonGenericClass(), GenericClassWith2TypeParameters<Int8, Int8>(), 114.514000f64])
            @Expect("assertion#12496: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_9")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [1i16, NonGenericClass(), GenericClassWith2TypeParameters<Int8, Int8>(), 114.514000f64])
            @Expect("assertion#12497: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo
                .getFunctions("globalFunction_9")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float32>()],
                    [114.514000f64, NonGenericClass(), GenericClassWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#12498: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_9")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Float32>()],
                    [114.514000f64, NonGenericClass(), GenericClassWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#12499: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_9")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int16>()],
                    [114.514000f64, NonGenericClass(), GenericClassWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#12500: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_9")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [114.514000f64, NonGenericClass(), GenericClassWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#12501: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo
                .getFunctions("globalFunction_9")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float32>()],
                    [1i16, (), GenericClassWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#12502: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_9")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Float32>()],
                    [1i16, (), GenericClassWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#12503: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_9")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int16>()],
                    [1i16, (), GenericClassWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#12504: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_9")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [1i16, (), GenericClassWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#12505: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo
                .getFunctions("globalFunction_9")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float32>()], [1i16, NonGenericClass(), ()])
            @Expect("assertion#12506: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_9")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Float32>()], [1i16, NonGenericClass(), ()])
            @Expect("assertion#12507: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_9")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [1i16, NonGenericClass(), ()])
            @Expect("assertion#12508: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_9")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [1i16, NonGenericClass(), ()])
            @Expect("assertion#12509: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("testcase TestCase_444 ends.")
    }
}
