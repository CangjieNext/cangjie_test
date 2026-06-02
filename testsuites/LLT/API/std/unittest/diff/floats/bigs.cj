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
        let a = 99999999999999.9
        let b = 99999999999999.8
        @Assert(a, b)
    }
    @TestCase
    func case2() {
        let a = 99999999999999.9
        let b = 89999999999999.8
        @Assert(a, b)
    }
    @TestCase
    func case3() {
        let a = 28903759873205987023540982314.2
        let b = 88903759873205987023540982314.2
        @Assert(a, b)
    }
    @TestCase
    func case4() {
        let a = 28903759873205087023540982314.2
        let b = 28903759873205987023540982314.2
        @Assert(a, b)
    }
    @TestCase
    func case5() {
        let a = 28903759873205087023540982314.2
        let b = 28903759873205087023540982314.2 / 28903759873205087023540982314.2
        @Assert(a, b)
    }
    @TestCase
    func case6() {
        let a = 28903759873205087023540982314.2
        let b = 28903759873205087023540982314.2 / 1.000000000000001
        @Assert(a, b)
    }
}

/* SCAN-IN
    Assert Failed: {COLOR=YELLOW}a{/COLOR} != {COLOR=YELLOW}b{/COLOR}
         a: 99999999999999.{COLOR=RED}90625{/COLOR}
         b: 99999999999999.{COLOR=RED}796875{/COLOR}
     delta: {COLOR=YELLOW}0.109375{/COLOR}
 */

/* SCAN-IN
    Assert Failed: {COLOR=YELLOW}a{/COLOR} != {COLOR=YELLOW}b{/COLOR}
         a: {COLOR=RED}1e+14{/COLOR}
         b: {COLOR=RED}9e+13{/COLOR}
     delta: {COLOR=YELLOW}1e+13{/COLOR}
 */

/* SCAN-IN
    Assert Failed: {COLOR=YELLOW}a{/COLOR} != {COLOR=YELLOW}b{/COLOR}
         a: {COLOR=RED}2.89038e+28{/COLOR}
         b: {COLOR=RED}8.89038e+28{/COLOR}
     delta: {COLOR=YELLOW}-6e+28{/COLOR}
 */

/* SCAN-IN
    Assert Failed: {COLOR=YELLOW}a{/COLOR} != {COLOR=YELLOW}b{/COLOR}
         a: 2.890375987320{COLOR=RED}5e+28{/COLOR}
         b: 2.890375987320{COLOR=RED}6e+28{/COLOR}
     delta: {COLOR=YELLOW}-8.9720148826522e+14{/COLOR}
 */

/* SCAN-IN
    Assert Failed: {COLOR=YELLOW}a{/COLOR} != {COLOR=YELLOW}b{/COLOR}
         a: {COLOR=RED}2.89038e+28{/COLOR}
         b: {COLOR=RED}1.0{/COLOR}
     delta: {COLOR=YELLOW}2.89038e+28{/COLOR}
 */

/* SCAN-IN
    Assert Failed: {COLOR=YELLOW}a{/COLOR} != {COLOR=YELLOW}b{/COLOR}
         a: 2.89037598732050{COLOR=RED}884286e+28{/COLOR}
         b: 2.89037598732050{COLOR=RED}576423e+28{/COLOR}
     delta: {COLOR=YELLOW}30786325577728.0{/COLOR}
 */
