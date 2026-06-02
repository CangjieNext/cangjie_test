/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

import std.unittest.*
import std.unittest.testmacro.*

class Un <: ToString {
    Un(let x: Int64, let throwing!: Bool = false) {}
    public func toString() {
        "Un(${x})"
    }
    operator func -(): Un {
        if (throwing) {
            throw Exception("${x}")
        } else {
            Un(-x)
        }
    }
    operator func +(other: Un) {
        Un(x + other.x, throwing: this.throwing || other.throwing)
    }
    prop positive: Bool {
        get() {
            x > 0
        }
    }
}

@Test
public class TestA {
    @TestCase
    func case1(): Unit {
        let x = -105
        @PowerAssert(-x + -x == -x)
    }

    /* SCAN-IN
    Assert Failed: `({COLOR=YELLOW}-x + -x == -x{/COLOR})`
                    ||_| ||_|  ||_|
                    |-105|-105 |-105
                    |__| |__|  |__|
                    |105  105   105
                    |_______|
                       210
     */
    @TestCase
    func case2(): Unit {
        let u = Un(32)
        @PowerAssert((-u).positive)
    }

    /* SCAN-IN
    Assert Failed: `({COLOR=YELLOW}(-u).positive{/COLOR})`
                     ||_|
                     Un(32)
                     |__|
                    Un(-32)
     */
    @TestCase
    func case3(): Unit {
        let u = Un(32, throwing: true)
        @PowerAssert((-(-(-u))).positive)
    }

    /* SCAN-IN
    Assert Failed: `({COLOR=GRAY}(-(-({/COLOR}{COLOR=RED}-{/COLOR}{COLOR=YELLOW}u{/COLOR}{COLOR=GRAY}))).positive{/COLOR})`
                    || | ||_|||         |
                    || | Un(32)         |
                    || | |__|||         |
                    ||[Exception]       |
                    || |_____||         |
                    [not computed]      |
                    ||________|         |
                   [not computed]       |
                    |___________________|
                        [not computed]
     */
    @TestCase
    func case4(): Unit {
        let u = Un(32, throwing: true)
        @PowerAssert((u + u + u + -u + u).positive)
    }

    /* SCAN-IN
    Assert Failed: `({COLOR=GRAY}({/COLOR}{COLOR=YELLOW}u + u + u{/COLOR}{COLOR=GRAY} + {/COLOR}{COLOR=RED}-{/COLOR}{COLOR=YELLOW}u{/COLOR}{COLOR=GRAY} + u).positive{/COLOR})`
                    ||_| | | |_| || |   |         |
                    Un(32) |Un(32)| |   |         |
                    ||   |_|   | ||_|   |         |
                    ||  Un(32) | Un(32) |         |
                    ||_____|   | |__|   |         |
                    ||Un(64)  [Exception]         |
                    ||_________|    |   |         |
                    ||  Un(96)      |   |         |
                    ||______________|   |         |
                    ||[not computed]    |         |
                    ||__________________|         |
                    |   [not computed]            |
                    |_____________________________|
                             [not computed]
     */
}
