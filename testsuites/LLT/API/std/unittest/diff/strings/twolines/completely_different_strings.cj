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
    func case1(): Unit {
        let a = " "
        let b = "."
        @Assert(a, b)
    }
    @TestCase
    func case2(): Unit {
        let a = "IELTS sample test questions. Official practice and sample questions and answers."
        let b = "We have a range of materials to help you do well in your IELTS test"
        @Assert(a, b)
    }
    @TestCase
    func case3(): Unit {
        let a = "IELTS sample test questions."
        let b = "IELTS do well in your IELTS test."
        @Assert(a, b)
    }
    @TestCase
    func case4(): Unit {
        let a = "12"
        let b = "34"
        @Assert(a, b)
    }
    @TestCase
    func case5(): Unit {
        let a = "123"
        let b = "345"
        @Assert(a, b)
    }
    @TestCase
    func case6(): Unit {
        let a = "12345-"
        let b = "19876_"
        @Assert(a, b)
    }
    @TestCase
    func case7(): Unit {
        let a = "_12345"
        let b = "-98765"
        @Assert(a, b)
    }
    @TestCase
    func case8(): Unit {
        let a = "12345"
        let b = "98360"
        @Assert(a, b)
    }
    @TestCase
    func case9(): Unit {
        let a = "12"
        let b = "13"
        @Assert(a, b)
    }
    @TestCase
    func case10(): Unit {
        let a = "54"
        let b = "64"
        @Assert(a, b)
    }
}

/* SCAN-IN
    Assert Failed: {COLOR=YELLOW}a{/COLOR} != {COLOR=YELLOW}b{/COLOR}
        a: "{COLOR=YELLOW} {/COLOR}"
        b: "{COLOR=YELLOW}.{/COLOR}"
 */

/* SCAN-IN
    Assert Failed: {COLOR=YELLOW}a{/COLOR} != {COLOR=YELLOW}b{/COLOR}
        a: "{COLOR=YELLOW}IELTS sample test questions. Official practice and sample questions and answers.{/COLOR}"
        b: "{COLOR=YELLOW}We have a range of materials to help you do well in your IELTS test{/COLOR}"
 */

/* SCAN-IN
    Assert Failed: {COLOR=YELLOW}a{/COLOR} != {COLOR=YELLOW}b{/COLOR}
        a: "{COLOR=YELLOW}IELTS sample test questions.{/COLOR}"
        b: "{COLOR=YELLOW}IELTS do well in your IELTS test.{/COLOR}"
 */

/* SCAN-IN
    Assert Failed: {COLOR=YELLOW}a{/COLOR} != {COLOR=YELLOW}b{/COLOR}
        a: "{COLOR=YELLOW}12{/COLOR}"
        b: "{COLOR=YELLOW}34{/COLOR}"
 */

/* SCAN-IN
    Assert Failed: {COLOR=YELLOW}a{/COLOR} != {COLOR=YELLOW}b{/COLOR}
        a: "{COLOR=YELLOW}123{/COLOR}"
        b: "{COLOR=YELLOW}345{/COLOR}"
 */

/* SCAN-IN
    Assert Failed: {COLOR=YELLOW}a{/COLOR} != {COLOR=YELLOW}b{/COLOR}
        a: "{COLOR=YELLOW}12345-{/COLOR}"
        b: "{COLOR=YELLOW}19876_{/COLOR}"
 */

/* SCAN-IN
    Assert Failed: {COLOR=YELLOW}a{/COLOR} != {COLOR=YELLOW}b{/COLOR}
        a: "{COLOR=YELLOW}_12345{/COLOR}"
        b: "{COLOR=YELLOW}-98765{/COLOR}"
 */

/* SCAN-IN
    Assert Failed: {COLOR=YELLOW}a{/COLOR} != {COLOR=YELLOW}b{/COLOR}
        a: "{COLOR=YELLOW}12345{/COLOR}"
        b: "{COLOR=YELLOW}98360{/COLOR}"
 */

/* SCAN-IN
    Assert Failed: {COLOR=YELLOW}a{/COLOR} != {COLOR=YELLOW}b{/COLOR}
        a: "{COLOR=YELLOW}12{/COLOR}"
        b: "{COLOR=YELLOW}13{/COLOR}"
 */

/* SCAN-IN
    Assert Failed: {COLOR=YELLOW}a{/COLOR} != {COLOR=YELLOW}b{/COLOR}
        a: "{COLOR=YELLOW}54{/COLOR}"
        b: "{COLOR=YELLOW}64{/COLOR}"
 */
