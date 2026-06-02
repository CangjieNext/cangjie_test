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
        let a = "Please, give me the apple"
        let b = "Please, Give me an apple"
        @Assert(a, b)
    }

    @TestCase
    func case2(): Unit {
        let a = "asdaasdasdaqwertasdasdas"
        let b = "asdasdasdbwertyasdasdasdas"
        @Assert(a, b)
    }

    @TestCase
    func case3(): Unit {
        let a = ""
        let b = " "
        @Assert(a, b)
    }

    @TestCase
    func case4(): Unit {
        let a = "1"
        let b = ""
        @Assert(a, b)
    }

    @TestCase
    func case5(): Unit {
        let a = ""
        let b = "1"
        @Assert(a, b)
    }

    @TestCase
    func case6(): Unit {
        let a = "2"
        let b = "1"
        @Assert(a, b)
    }
}

/* SCAN-IN
    Assert Failed: {COLOR=YELLOW}a{/COLOR} != {COLOR=YELLOW}b{/COLOR}
        a: "Please, {COLOR=YELLOW}g{/COLOR}ive me {COLOR=RED}t{/COLOR}{COLOR=YELLOW}he{/COLOR} apple"
        b: "Please, {COLOR=YELLOW}G{/COLOR}ive me {COLOR=RED}·{/COLOR}{COLOR=YELLOW}an{/COLOR} apple"
            ========{COLOR=YELLOW}!{/COLOR}======={COLOR=RED}-{/COLOR}{COLOR=YELLOW}!!{/COLOR}======
 */

/* SCAN-IN
    Assert Failed: {COLOR=YELLOW}a{/COLOR} != {COLOR=YELLOW}b{/COLOR}
        a: "asd{COLOR=RED}a{/COLOR}asdasd{COLOR=RED}a{/COLOR}{COLOR=YELLOW}q{/COLOR}wert{COLOR=GREEN}·{/COLOR}asdasdas{COLOR=GREEN}···{/COLOR}"
        b: "asd{COLOR=RED}·{/COLOR}asdasd{COLOR=RED}·{/COLOR}{COLOR=YELLOW}b{/COLOR}wert{COLOR=GREEN}y{/COLOR}asdasdas{COLOR=GREEN}das{/COLOR}"
            ==={COLOR=RED}-{/COLOR}======{COLOR=RED}-{/COLOR}{COLOR=YELLOW}!{/COLOR}===={COLOR=GREEN}+{/COLOR}========{COLOR=GREEN}+++{/COLOR}
 */

/* SCAN-IN
    Assert Failed: {COLOR=YELLOW}a{/COLOR} != {COLOR=YELLOW}b{/COLOR}
        a: ""
        b: "{COLOR=YELLOW} {/COLOR}"
 */

/* SCAN-IN
    Assert Failed: {COLOR=YELLOW}a{/COLOR} != {COLOR=YELLOW}b{/COLOR}
        a: "{COLOR=YELLOW}1{/COLOR}"
        b: ""
 */

/* SCAN-IN
    Assert Failed: {COLOR=YELLOW}a{/COLOR} != {COLOR=YELLOW}b{/COLOR}
        a: ""
        b: "{COLOR=YELLOW}1{/COLOR}"
 */

/* SCAN-IN
    Assert Failed: {COLOR=YELLOW}a{/COLOR} != {COLOR=YELLOW}b{/COLOR}
        a: "{COLOR=YELLOW}2{/COLOR}"
        b: "{COLOR=YELLOW}1{/COLOR}"
 */
