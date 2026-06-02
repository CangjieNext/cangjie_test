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

class C {
    static let x = "Please, __give me the apple"
    let _x = "Please, give me the apple"
}

class B {
    let y = "Please, gi33ve me the apple"
    let c = C()
}

class A {
    let z = "Please, gi3355ve me the apple"
    let b = B()
}

@Test
public class TestA {
    @TestCase
    func case1(): Unit {
        let a = "Please, give me the apple"
        let b = B()
        @Assert(a, b.y)
    }

    @TestCase
    func case2(): Unit {
        let a = "asdaasdasdaqwertasdasdas"
        @Assert(a, B().c._x)
    }

    @TestCase
    func case3(): Unit {
        @Assert(C.x, A().b.c._x)
    }

    @TestCase
    func case4(): Unit {
        let abcd = "abcd"
        @Assert("a" + "abc" + abcd + "ab${abcd}cd", "aabcabcdabaccdcd")
    }
}

/* SCAN-IN
    Assert Failed: {COLOR=YELLOW}a{/COLOR} != {COLOR=YELLOW}b.y{/COLOR}
          a: "Please, gi{COLOR=GREEN}··{/COLOR}ve me the apple"
        b.y: "Please, gi{COLOR=GREEN}33{/COLOR}ve me the apple"
              =========={COLOR=GREEN}++{/COLOR}===============
 */

/* SCAN-IN
    Assert Failed: {COLOR=YELLOW}a{/COLOR} != {COLOR=YELLOW}B().c._x{/COLOR}
               a: "{COLOR=YELLOW}asdaasdasdaqwertasdasdas{/COLOR}"
        B().c._x: "{COLOR=YELLOW}Please, give me the apple{/COLOR}"
 */

/* SCAN-IN
    Assert Failed: {COLOR=YELLOW}C.x{/COLOR} != {COLOR=YELLOW}A().b.c._x{/COLOR}
               C.x: "Please, {COLOR=RED}__{/COLOR}give me the apple"
        A().b.c._x: "Please, {COLOR=RED}··{/COLOR}give me the apple"
                     ========{COLOR=RED}--{/COLOR}=================
 */

/* SCAN-IN
    Assert Failed: {COLOR=YELLOW}"a" + "abc" + abcd + "ab${abcd}cd"{/COLOR} != {COLOR=YELLOW}"aabcabcdabaccdcd"{/COLOR}
        "a" + "abc" + abcd + "ab${abcd}cd": "aabcabcdaba{COLOR=YELLOW}b{/COLOR}cdcd"
                        "aabcabcdabaccdcd": "aabcabcdaba{COLOR=YELLOW}c{/COLOR}cdcd"
                                             ==========={COLOR=YELLOW}!{/COLOR}====
*/
