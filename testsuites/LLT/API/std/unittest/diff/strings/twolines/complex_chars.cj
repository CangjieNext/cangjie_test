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
        let a = "我想吃中餐。"
        let b = "我们想吃中餐。"
        @Assert(a, b)
    }

    @TestCase
    func case2(): Unit {
        let a = "复杂BCxD杂ExFxG复HAAAAAAAAAAAAAAAAAAAAAAAAA"
        let b = "x复B超CDxE杂FyG超HAAAAAAAAAAAAAAAAAAAAAAAAA"
        @Assert(a, b)
    }

    @TestCase
    func case3(): Unit {
        let a = "复杂BCxD杂ExFxG复H"
        let b = "x复B超CDxE杂FyG超H"
        @Assert(a, b)
    }

    @TestCase
    func case4(): Unit {
        let a = "复杂BCxD杂ExFxG复H"
        let b = "x复B超CD"
        @Assert(a, b)
    }

    @TestCase
    func case5(): Unit {
        let a = "复杂BCxD"
        let b = "x复B超CDxE杂FyG超H"
        @Assert(a, b)
    }
}

/* SCAN-IN
    Assert Failed: {COLOR=YELLOW}a{/COLOR} != {COLOR=YELLOW}b{/COLOR}
        a: "我{COLOR=GREEN}· {/COLOR}想吃中餐。"
        b: "我{COLOR=GREEN}们{/COLOR}想吃中餐。"
            =={COLOR=GREEN}+ {/COLOR}==========
 */

/* SCAN-IN
    Assert Failed: {COLOR=YELLOW}a{/COLOR} != {COLOR=YELLOW}b{/COLOR}
        a: "{COLOR=GREEN}·{/COLOR}复{COLOR=RED}杂{/COLOR}B{COLOR=GREEN}· {/COLOR}C{COLOR=RED}x{/COLOR}D{COLOR=YELLOW}杂{/COLOR}E{COLOR=YELLOW}x {/COLOR}F{COLOR=YELLOW}x{/COLOR}G{COLOR=YELLOW}复{/COLOR}HAAAAAAAAAAAAAAAAAAAAAAAAA"
        b: "{COLOR=GREEN}x{/COLOR}复{COLOR=RED}· {/COLOR}B{COLOR=GREEN}超{/COLOR}C{COLOR=RED}·{/COLOR}D{COLOR=YELLOW}x {/COLOR}E{COLOR=YELLOW}杂{/COLOR}F{COLOR=YELLOW}y{/COLOR}G{COLOR=YELLOW}超{/COLOR}HAAAAAAAAAAAAAAAAAAAAAAAAA"
            {COLOR=GREEN}+{/COLOR}=={COLOR=RED}- {/COLOR}={COLOR=GREEN}+ {/COLOR}={COLOR=RED}-{/COLOR}={COLOR=YELLOW}! {/COLOR}={COLOR=YELLOW}! {/COLOR}={COLOR=YELLOW}!{/COLOR}={COLOR=YELLOW}! {/COLOR}==========================
 */

/* SCAN-IN
    Assert Failed: {COLOR=YELLOW}a{/COLOR} != {COLOR=YELLOW}b{/COLOR}
        a: "{COLOR=YELLOW}复杂BCxD杂ExFxG复H{/COLOR}"
        b: "{COLOR=YELLOW}x复B超CDxE杂FyG超H{/COLOR}"
 */

/* SCAN-IN
    Assert Failed: {COLOR=YELLOW}a{/COLOR} != {COLOR=YELLOW}b{/COLOR}
        a: "{COLOR=YELLOW}复杂BCxD杂ExFxG复H{/COLOR}"
        b: "{COLOR=YELLOW}x复B超CD{/COLOR}"
 */

/* SCAN-IN
    Assert Failed: {COLOR=YELLOW}a{/COLOR} != {COLOR=YELLOW}b{/COLOR}
        a: "{COLOR=YELLOW}复杂BCxD{/COLOR}"
        b: "{COLOR=YELLOW}x复B超CDxE杂FyG超H{/COLOR}"
 */
