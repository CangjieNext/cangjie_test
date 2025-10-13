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
import std.collection.*

@Test
public class TestA {
    @TestCase
    func case1() {
        let a = [[0.3, 0.2], [1287478123.28374, 2.92371471234]]
        let b = [[0.2 + 0.1, 0.2], [1287478124.28374, 2.92371471239]]
        @Assert(a, b)
    }
    @TestCase
    func case2() {
        let a = [[3, 2], [1287478123, -999]]
        let b = [[2 + 1, 2], [1287478124, -1000]]
        @Assert(a, b)
    }
    @TestCase
    func case3() {
        let a = [["ab", "_`"], ["pac", "use"]]
        let b = [["ba", "+'"], ["nopac", "don't use"]]
        @Assert(a, b)
    }
    @TestCase
    func case4() {
        let hm1 = HashMap([(1, 1), (2, 9), (4, 1), (5, 3)])
        let hm2 = HashMap([(1, 1), (2, 9), (4, 1)])
        let a = [[hm1, hm2], [hm1, hm2]]
        let b = [[hm2, hm1], [hm1, hm1]]
        @Assert(a, b)
    }
}

/* SCAN-IN
    Assert Failed: 
        Different elements (left - a, right - b):
            [0]:
                Different elements (left - a[0], right - b[0]):
                    [0]:
                          a[0]: 0.{COLOR=RED}299999999999999988898{/COLOR}
                          b[0]: 0.{COLOR=RED}300000000000000044409{/COLOR}
                         delta: {COLOR=YELLOW}-5.55111512312578270212e-17{/COLOR}
            [1]:
                Different elements (left - a[1], right - b[1]):
                    [0]:
                          a[1]: 128747812{COLOR=RED}3.2837{/COLOR}
                          b[1]: 128747812{COLOR=RED}4.2837{/COLOR}
                         delta: {COLOR=YELLOW}-1.0{/COLOR}
                    [1]:
                          a[1]: 2.9237147123{COLOR=RED}4{/COLOR}
                          b[1]: 2.9237147123{COLOR=RED}9{/COLOR}
                         delta: {COLOR=YELLOW}-5.0000004137019e-11{/COLOR}
 */

/* SCAN-IN
    Assert Failed: 
        Different elements (left - a, right - b):
            [1]:
                Different elements (left - a[1], right - b[1]):
                    [0]: {COLOR=YELLOW}1287478123{/COLOR} != {COLOR=YELLOW}1287478124{/COLOR}
                    [1]: {COLOR=YELLOW}-999{/COLOR} != {COLOR=YELLOW}-1000{/COLOR}
 */
/* SCAN-IN
    Assert Failed: 
        Different elements (left - a, right - b):
            [0]:
                Different elements (left - a[0], right - b[0]):
                    [0]: "{COLOR=YELLOW}ab{/COLOR}" != "{COLOR=YELLOW}ba{/COLOR}"
                    [1]: "{COLOR=YELLOW}_`{/COLOR}" != "{COLOR=YELLOW}+'{/COLOR}"
            [1]:
                Different elements (left - a[1], right - b[1]):
                    [0]: "{COLOR=YELLOW}pac{/COLOR}" != "{COLOR=YELLOW}nopac{/COLOR}"
                    [1]:
                        a[1]: "{COLOR=GREEN}······{/COLOR}use"
                        b[1]: "{COLOR=GREEN}don't {/COLOR}use"
                               {COLOR=GREEN}++++++{/COLOR}===
 */
/* SCAN-IN
    Assert Failed: 
        Different elements (left - a, right - b):
            [0]:
                Different elements (left - a[0], right - b[0]):
                    [0]:
                        Different sizes: {COLOR=YELLOW}4{/COLOR}(a[0][0]) != {COLOR=YELLOW}3{/COLOR}(b[0][0])
                        Missed keys in b[0][0]: [5]
                    [1]:
                        Different sizes: {COLOR=YELLOW}3{/COLOR}(a[0][1]) != {COLOR=YELLOW}4{/COLOR}(b[0][1])
                        Missed keys in a[0][1]: [5]
            [1]:
                Different elements (left - a[1], right - b[1]):
                    [1]:
                        Different sizes: {COLOR=YELLOW}3{/COLOR}(a[1][1]) != {COLOR=YELLOW}4{/COLOR}(b[1][1])
                        Missed keys in a[1][1]: [5]
 */
