/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

@Test
class RangeExprTest {
    func inRange(i: Int64, r: Range<Int64>) {
        // It's just a stub method, it may not check actual belonging of [i] to [r].
        r.start <= i && i <= r.end
    }

    @TestCase
    func case1() {
        let getLower: () -> Int64 = {=> 5}
        let getUpper: () -> Int64 = {=> 10}

        @PowerAssert(inRange(4, getLower()..getUpper()), true)
    }

    /* SCAN-IN
    Assert Failed: `({COLOR=YELLOW}inRange(4, getLower()..getUpper()) == true{/COLOR})`
                    |          |__________||__________||
                    |                5          10     |
                    |__________________________________|
                                    false
     */
    @TestCase
    func caseException() {
        let getLower: () -> Int64 = {=> 5}
        let getUpper: () -> Int64 = {=> 10}
        let getUpperThrowing: () -> Int64 = {=> throw Exception()}

        @PowerAssert(inRange(4, getLower()..getUpper()), inRange(4, getLower()..getUpperThrowing()))
    }

    /* SCAN-IN
    Assert Failed: `({COLOR=YELLOW}inRange(4, getLower()..getUpper()){/COLOR}{COLOR=GRAY} == inRange(4, {/COLOR}{COLOR=YELLOW}getLower(){/COLOR}{COLOR=GRAY}..{/COLOR}{COLOR=RED}getUpperThrowing(){/COLOR}{COLOR=GRAY}){/COLOR})`
                    |          |__________||__________||  |          |__________||__________________||
                    |                5          10     |  |          |     5          [Exception]   ||
                    |__________________________________|  |          |______________________________||
                    |               false                 |                   [not computed]         |
                    |                                     |__________________________________________|
                    |                                                    [not computed]              |
                    |________________________________________________________________________________|
                                                      [not computed]
     */
}
