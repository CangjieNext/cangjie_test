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
    func case2(): Unit {
        let a = "134"
        let b = "135"
        @Assert(a, b)
    }
    @TestCase
    func case3(): Unit {
        let a = "194"
        let b = "135"
        @Assert(a, b)
    }
    @TestCase
    func case4(): Unit {
        let a = "aaa"
        let b = "aab"
        @Assert(a, b)
    }
    @TestCase
    func case5(): Unit {
        let a = "41"
        let b = "44"
        @Assert(a, b)
    }
    @TestCase
    func case6(): Unit {
        let a = "az"
        let b = "bz"
        @Assert(a, b)
    }
    @TestCase
    func case7(): Unit {
        let a = "abc"
        let b = "c"
        @Assert(a, b)
    }
    @TestCase
    func case8(): Unit {
        let a = "ab"
        let b = "caa"
        @Assert(a, b)
    }
}

/* SCAN-IN
    Assert Failed: {COLOR=YELLOW}a{/COLOR} != {COLOR=YELLOW}b{/COLOR}
        a: "{COLOR=YELLOW}134{/COLOR}"
        b: "{COLOR=YELLOW}135{/COLOR}"
 */

/* SCAN-IN
    Assert Failed: {COLOR=YELLOW}a{/COLOR} != {COLOR=YELLOW}b{/COLOR}
        a: "{COLOR=YELLOW}194{/COLOR}"
        b: "{COLOR=YELLOW}135{/COLOR}"
 */

/* SCAN-IN
    Assert Failed: {COLOR=YELLOW}a{/COLOR} != {COLOR=YELLOW}b{/COLOR}
        a: "{COLOR=YELLOW}aaa{/COLOR}"
        b: "{COLOR=YELLOW}aab{/COLOR}"
 */

/* SCAN-IN
    Assert Failed: {COLOR=YELLOW}a{/COLOR} != {COLOR=YELLOW}b{/COLOR}
        a: "{COLOR=YELLOW}41{/COLOR}"
        b: "{COLOR=YELLOW}44{/COLOR}"
 */

/* SCAN-IN
    Assert Failed: {COLOR=YELLOW}a{/COLOR} != {COLOR=YELLOW}b{/COLOR}
        a: "{COLOR=YELLOW}az{/COLOR}"
        b: "{COLOR=YELLOW}bz{/COLOR}"
 */

/* SCAN-IN
    Assert Failed: {COLOR=YELLOW}a{/COLOR} != {COLOR=YELLOW}b{/COLOR}
        a: "{COLOR=YELLOW}abc{/COLOR}"
        b: "{COLOR=YELLOW}c{/COLOR}"
 */

/* SCAN-IN
    Assert Failed: {COLOR=YELLOW}a{/COLOR} != {COLOR=YELLOW}b{/COLOR}
        a: "{COLOR=YELLOW}ab{/COLOR}"
        b: "{COLOR=YELLOW}caa{/COLOR}"
 */
