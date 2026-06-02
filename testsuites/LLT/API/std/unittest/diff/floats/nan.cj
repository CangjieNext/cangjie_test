/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -Woff=all %n.cj -o %output %cmp_utest_opt 2>&1
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

import std.unittest.*
import std.unittest.testmacro.*
import std.math.*

@Test
public class TestA {
    @TestCase
    func case1() {
        let a = Float64.NaN
        let b = Float64.NaN
        @Assert(a, b)
    }
    @TestCase
    func case2() {
        let a = -0.0
        let b = Float64.NaN
        @Assert(a, b)
    }
    @TestCase
    func case3() {
        let a2 = Float16.NaN
        let b2 = Float16.NaN
        @Assert(a2, b2)
    }
    @TestCase
    func case4() {
        let a3 = Float16(99999999999999999999999999999.9)
        let b3 = Float16.NaN
        @Assert(a3, b3)
    }
    @TestCase
    func case5() {
        let a4 = Float16.NaN
        let b4 = Float16(-99999999999999999999999999999.9)
        @Assert(a4, b4)
    }
    @TestCase
    func case6() {
        let a4 = Float16.NaN
        let b4 = Float16(-95.003)
        @Assert(a4, b4)
    }
    @TestCase
    func case7() {
        let a4 = Float32.NaN
        let b4 = Float32.Max
        @Assert(a4, b4)
    }
    @TestCase
    func case8() {
        let a4 = Float64.Min
        let b4 = Float64.NaN
        @Assert(a4, b4)
    }
}

/* SCAN-IN
    Assert Failed: {COLOR=YELLOW}a{/COLOR} != {COLOR=YELLOW}b{/COLOR}
        a: {COLOR=RED}nan{/COLOR}
        b: {COLOR=RED}nan{/COLOR}
 */

/* SCAN-IN
    Assert Failed: {COLOR=YELLOW}a{/COLOR} != {COLOR=YELLOW}b{/COLOR}
        a: {COLOR=RED}-0.0{/COLOR}
        b: {COLOR=RED}nan{/COLOR}
 */

/* SCAN-IN
    Assert Failed: {COLOR=YELLOW}a2{/COLOR} != {COLOR=YELLOW}b2{/COLOR}
       a2: {COLOR=RED}nan{/COLOR}
       b2: {COLOR=RED}nan{/COLOR}
 */

/* SCAN-IN
    Assert Failed: {COLOR=YELLOW}a3{/COLOR} != {COLOR=YELLOW}b3{/COLOR}
       a3: {COLOR=RED}inf{/COLOR}
       b3: {COLOR=RED}nan{/COLOR}
 */

/* SCAN-IN
    Assert Failed: {COLOR=YELLOW}a4{/COLOR} != {COLOR=YELLOW}b4{/COLOR}
       a4: {COLOR=RED}nan{/COLOR}
       b4: {COLOR=RED}-inf{/COLOR}
 */

/* SCAN-IN
    Assert Failed: {COLOR=YELLOW}a4{/COLOR} != {COLOR=YELLOW}b4{/COLOR}
       a4: {COLOR=RED}nan{/COLOR}
       b4: {COLOR=RED}-95.0{/COLOR}
 */

/* SCAN-IN
    Assert Failed: {COLOR=YELLOW}a4{/COLOR} != {COLOR=YELLOW}b4{/COLOR}
       a4: {COLOR=RED}-1.79769e+308{/COLOR}
       b4: {COLOR=RED}nan{/COLOR}
 */
