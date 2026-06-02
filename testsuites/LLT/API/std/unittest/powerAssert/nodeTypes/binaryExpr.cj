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

class Bin <: ToString {
    Bin(let x: Int64, private let throwing!: Bool = false) {}
    operator func +(other: Bin) {
        if (throwing) {
            throw Exception("${x}")
        }
        Bin(x * 10 + other.x)
    }
    prop small: Bool {
        get() {
            x < 1000
        }
    }
    public func toString() {
        "Bin(${x})"
    }
}

@Test
public class TestA {
    @TestCase
    func case1(): Unit {
        @PowerAssert(1/8 >= 4)
    }

    /* SCAN-IN
    Assert Failed: `({COLOR=YELLOW}1 / 8 >= 4{/COLOR})`
                    |_____|
                       0
     */
    @TestCase
    func case2(): Unit {
        let bindata = Bin(32)
        @PowerAssert((bindata + bindata + bindata + Bin(10)).small)
    }

    /* SCAN-IN
    Assert Failed: `({COLOR=YELLOW}(bindata + bindata + bindata + Bin(10)).small{/COLOR})`
                     |_______| |_______| |_______| |_______|
                     |Bin(32)   Bin(32)|  Bin(32)|  Bin(10)|
                     |_________________|         |         |
                     |     Bin(352)              |         |
                     |___________________________|         |
                     |         Bin(3552)                   |
                     |_____________________________________|
                                    Bin(35530)
     */
    @TestCase
    func case3(): Unit {
        let bindata = Bin(32, throwing: true)
        @PowerAssert((bindata + bindata).small)
    }
}

/* SCAN-IN
    Assert Failed: `({COLOR=GRAY}({/COLOR}{COLOR=YELLOW}bindata{/COLOR}{COLOR=RED} + {/COLOR}{COLOR=YELLOW}bindata{/COLOR}{COLOR=GRAY}).small{/COLOR})`
                    ||_______| |_______|      |
                    ||Bin(32)   Bin(32)|      |
                    ||_________________|      |
                    |    [Exception]          |
                    |_________________________|
                           [not computed]
 */
