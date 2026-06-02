/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// DEPENDENCE: ./dynloading_cjnative
// (CJNATIVE) EXEC: %compiler %cmp_opt -Woff all dynloading_cjnative/a.b.c.cj --output-type=dylib -o a.b.c.%dylib_suffix
// (CJNATIVE) EXEC: %compiler %cmp_opt -Woff all dynloading_cjnative/a.b.cj --output-type=dylib -o a.b.%dylib_suffix
// (CJNATIVE) EXEC: %compiler %cmp_opt -Woff all dynloading_cjnative/a.cj --output-type=dylib -o a.%dylib_suffix
// (CJNATIVE) EXEC: %compiler %cmp_opt -Woff all dynloading_cjnative/a1.b1.cj --output-type=dylib -o a1.b1.%dylib_suffix
// (CJNATIVE) EXEC: %compiler %cmp_opt -Woff all dynloading_cjnative/a1.cj --output-type=dylib -L. -l:a1.b1.%dylib_suffix -o a1.%dylib_suffix
// (CJNATIVE) EXEC: %cpfile a.%dylib_suffix a1.%dylib_suffix && %cpfile a.%dylib_suffix dynloading_cjnative/a.%dylib_suffix
// (CJNATIVE) EXEC: %touch fake.%dylib_suffix
// (CJNATIVE) EXEC: %compiler %cmp_opt %f -Woff all -g -o %output %cmp_utest_opt
// (CJNATIVE) RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

import std.reflect.*

@Test
class DynloadingTest {
    @TestCase
    func packageTest(): Unit {
        let info1 = PackageInfo.load("a.b.c")
        try {
            info1.parentPackage
            @Expect(false)
        } catch (e: ReflectException) {
            @Expect(e.message.contains("Cannot find"))
        }
        @Expect(info1.subPackages.size, 0)
        @Expect(info1.version, "")

        let f1 = spawn {
            => try {
                PackageInfo.load("a.b")
                0
            } catch (e: ReflectException) {
                1
            }
        }
        let f2 = spawn {
            => try {
                PackageInfo.load("a.b")
                0
            } catch (e: ReflectException) {
                println(e)
                1
            }
        }
        @Expect(f1.get() + f2.get(), 1)

        try {
            @Expect(info1.parentPackage.qualifiedName, "a.b")
        } catch (e: ReflectException) {
            @Expect(false)
        }

        let info2 = PackageInfo.get('a.b')
        @Expect(info2.subPackages.size, 1)

        try {
            info1.rootPackage
            @Expect(false)
        } catch (e: ReflectException) {
            @Expect(e.message.contains("Cannot find"))
        }

        let info3 = PackageInfo.load("a")
        @Expect(info3.qualifiedName, "a")
        @Expect(info3.subPackages.size, 2)
        try {
            @Expect(info1.rootPackage.qualifiedName, "a")
            @Expect(info2.rootPackage.qualifiedName, "a")
            @Expect(info3.rootPackage == info3)
        } catch (e: ReflectException) {
            @Expect(false)
        }

        try {
            let sinfo1 = info3.getSubPackage("a.b")
            let sinfo2 = info3.getSubPackage("a.b.c")
        } catch (_: Exception) {
            @Expect(false)
        }
    }

    @TestCase
    func LoadTwice() {
        try {
            PackageInfo.load("dynloading_cjnative/a")
            @Expect(false)
        } catch (e: ReflectException) {
            @Expect(e.message.contains("twice"))
        }

        try {
            PackageInfo.load("a1")
            @Expect(false)
        } catch (e: ReflectException) {
            @Expect(e.message.contains("twice"))
        }

        try {
            PackageInfo.load("a1")
            @Expect(false)
        } catch (e: ReflectException) {
            @Expect(e.message.contains("twice"))
        }
    }

    @TestCase
    func LoadAndGetFail() {
        try {
            PackageInfo.load("xxx")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message.contains("illegal path"))
        }

        try {
            PackageInfo.load("fake")
            @Expect(false)
        } catch (e: ReflectException) {
            @Expect(e.message.contains("load failed"))
        }

        try {
            PackageInfo.get("xxx")
            @Expect(false)
        } catch (e: ReflectException) {
            @Expect(e.message.contains("Cannot find"))
        }
    }
}
