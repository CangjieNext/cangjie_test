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

@Test
public class TestA {
    @TestCase
    func case1() {
        let a: Float16 = 2.0
        let b: Float16 = 1.0
        @Assert(a, b)
    }
    @TestCase
    func case2() {
        let a: Float16 = 289.2
        let b: Float16 = 289.2 / 1.001
        @Assert(a, b)
    }
    @TestCase
    func case3() {
        let a: Float32 = 289.2
        let b: Float32 = 289.2 / 1.0000001
        @Assert(a, b)
    }
}

/* SCAN-IN
    Assert Failed: {COLOR=YELLOW}a{/COLOR} != {COLOR=YELLOW}b{/COLOR}
         a: {COLOR=RED}2.0{/COLOR}
         b: {COLOR=RED}1.0{/COLOR}
     delta: {COLOR=YELLOW}1.0{/COLOR}
 */

/* SCAN-IN
    Assert Failed: {COLOR=YELLOW}a{/COLOR} != {COLOR=YELLOW}b{/COLOR}
         a: 289.{COLOR=RED}25{/COLOR}
         b: 289.{COLOR=RED}0{/COLOR}
     delta: {COLOR=YELLOW}0.25{/COLOR}
 */

/* SCAN-IN
    Assert Failed: {COLOR=YELLOW}a{/COLOR} != {COLOR=YELLOW}b{/COLOR}
         a: 289.{COLOR=RED}200012{/COLOR}
         b: 289.{COLOR=RED}199982{/COLOR}
     delta: {COLOR=YELLOW}3.05175781e-05{/COLOR}
 */
