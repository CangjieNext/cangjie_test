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
        let a = Float64.Inf
        let b = -Float64.Inf
        @Assert(a, b)
    }
    @TestCase
    func case2() {
        let a = -Float64.Inf
        let b = -0.0
        @Assert(a, b)
    }
    @TestCase
    func case3() {
        let a2 = -Float32.Inf
        let b2 = Float32(Float16.Inf)
        @Assert(a2, b2)
    }
    @TestCase
    func case4() {
        let a2 = -Float16.Inf
        let b2 = Float16.Min
        @Assert(a2, b2)
    }
    @TestCase
    func case5() {
        let a2 = Float32.Max
        let b2 = Float32.Inf
        @Assert(a2, b2)
    }
    @TestCase
    func case6() {
        let a2 = -0.0
        let b2 = Float64.Min
        @Assert(a2, b2)
    }
}

/* SCAN-IN
    Assert Failed: {COLOR=YELLOW}a{/COLOR} != {COLOR=YELLOW}b{/COLOR}
        a: {COLOR=RED}inf{/COLOR}
        b: {COLOR=RED}-inf{/COLOR}
 */

/* SCAN-IN
    Assert Failed: {COLOR=YELLOW}a{/COLOR} != {COLOR=YELLOW}b{/COLOR}
        a: {COLOR=RED}-inf{/COLOR}
        b: {COLOR=RED}-0.0{/COLOR}
 */

/* SCAN-IN
    Assert Failed: {COLOR=YELLOW}a2{/COLOR} != {COLOR=YELLOW}b2{/COLOR}
       a2: {COLOR=RED}-inf{/COLOR}
       b2: {COLOR=RED}inf{/COLOR}
 */

/* SCAN-IN
    Assert Failed: {COLOR=YELLOW}a2{/COLOR} != {COLOR=YELLOW}b2{/COLOR}
       a2: {COLOR=RED}-inf{/COLOR}
       b2: {COLOR=RED}-65504.0{/COLOR}
 */

/* SCAN-IN
    Assert Failed: {COLOR=YELLOW}a2{/COLOR} != {COLOR=YELLOW}b2{/COLOR}
       a2: {COLOR=RED}3.40282e+38{/COLOR}
       b2: {COLOR=RED}inf{/COLOR}
 */

/* SCAN-IN
    Assert Failed: {COLOR=YELLOW}a2{/COLOR} != {COLOR=YELLOW}b2{/COLOR}
        a2: -{COLOR=RED}0.0{/COLOR}
        b2: -{COLOR=RED}1.79769e+308{/COLOR}
     delta: {COLOR=YELLOW}1.79769e+308{/COLOR}
 */
