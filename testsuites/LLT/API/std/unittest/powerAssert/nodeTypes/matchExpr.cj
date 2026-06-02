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
import std.deriving.*

@Derive[ToString]
enum E {
    | A
    | B(Int64)
    | C(?E, Int64)
}

@Test
public class TestMatch {
    /**
     * Checks suitable case in match-case.
     */
    @TestCase
    func case1(): Unit {
        let e = A
        let zero = 0
        @PowerAssert(
            match (e) {
                case A => zero
                case B(i) => i
                case C(Some(B(i1)), i2) => i1 + i2
                case C(_, i) => i
            }, -1
        )
    }

    /* SCAN-IN
    Assert Failed: `({COLOR=YELLOW}match (e) { case A => zero; case B(i) => i; case C(Some(B(i1)), i2) => i1 + i2; case C(_, i) => i } == - 1{/COLOR})`
                    |      |_|            |____|                                                                        |
                    |      E.A               0                                                                          |
                    |___________________________________________________________________________________________________|
                                                                      0
     */
    @TestCase
    func case2(): Unit {
        let e = B(1)
        let zero = 0
        @PowerAssert(
            match (e) {
                case A => zero
                case B(i) => i
                case C(Some(B(i1)), i2) => i1 + i2
                case C(_, i) => i
            }, -1
        )
    }

    /* SCAN-IN
    Assert Failed: `({COLOR=YELLOW}match (e) { case A => zero; case B(i) => i; case C(Some(B(i1)), i2) => i1 + i2; case C(_, i) => i } == - 1{/COLOR})`
                    |      |_|                               |_|                                                        |
                    |     E.B(1)                              1                                                         |
                    |___________________________________________________________________________________________________|
                                                                      1
     */
    @TestCase
    func case3(): Unit {
        let e = C(B(1), 2)
        let zero = 0
        @PowerAssert(
            match (e) {
                case A => zero
                case B(i) => i
                case C(Some(B(i1)), i2) => i1 + i2
                case C(_, i) => i
            }, -1
        )
    }

    /* SCAN-IN
    Assert Failed: `({COLOR=YELLOW}match (e) { case A => zero; case B(i) => i; case C(Some(B(i1)), i2) => i1 + i2; case C(_, i) => i } == - 1{/COLOR})`
                    |      |_|                                                             |__| |__|                    |
                   E.C(Some(E.B(1)), 2)                                                    | 1    2|                    |
                    |                                                                      |_______|                    |
                    |                                                                          3                        |
                    |___________________________________________________________________________________________________|
                                                                      3
     */
    @TestCase
    func case4(): Unit {
        let e = C(None, 2)
        let zero = 0
        @PowerAssert(
            match (e) {
                case A => zero
                case B(i) => i
                case C(Some(B(i1)), i2) => i1 + i2
                case C(_, i) => i
            }, -1
        )
    }

    /* SCAN-IN
    Assert Failed: `({COLOR=YELLOW}match (e) { case A => zero; case B(i) => i; case C(Some(B(i1)), i2) => i1 + i2; case C(_, i) => i } == - 1{/COLOR})`
                    |      |_|                                                                                      |_| |
                    |  E.C(None, 2)                                                                                  2  |
                    |___________________________________________________________________________________________________|
                                                                      2
     */
    @TestCase
    func testWildcard1(): Unit {
        let e = C(B(1), 2)
        let zero = 0
        @PowerAssert(
            match (e) {
                case A => throw Exception()
                case _ => zero
            }, -1
        )
    }

    /* SCAN-IN
    Assert Failed: `({COLOR=YELLOW}match (e) { case A => throw Exception(); case _ => zero } == - 1{/COLOR})`
                    |      |_|                                         |____| |
                   E.C(Some(E.B(1)), 2)                                   0   |
                    |_________________________________________________________|
                                                 0
     */
    @TestCase
    func testWildcard2(): Unit {
        let e = C(B(1), 2)
        @PowerAssert(
            match (e) {
                case C(_, i) => i
                case _ => throw Exception()
            }, -1
        )
    }

    /* SCAN-IN
    Assert Failed: `({COLOR=YELLOW}match (e) { case C(_, i) => i; case _ => throw Exception() } == - 1{/COLOR})`
                    |      |_|                  |_|                              |
                   E.C(Some(E.B(1)), 2)          2                               |
                    |____________________________________________________________|
                                                   2
     */
    @TestCase
    func testGuard(): Unit {
        let e = C(B(1), 2)
        @PowerAssert(
            match (e) {
                case C(Some(B(i1)), i2) where i1 + i2 < 0 => i1 + i2
                case C(Some(B(i1)), i2) where i1 + i2 > 0 => i1 + i2
                case _ => throw Exception()
            }, -1
        )
    }

    /* SCAN-IN
    Assert Failed: `({COLOR=YELLOW}match (e) { case C(Some(B(i1)), i2) where i1 + i2 < 0 => i1 + i2; case C(Some(B(i1)), i2) where i1 + i2 > 0 => i1 + i2; case _ => throw Exception() } == - 1{/COLOR})`
                    |      |_|                                |__| |__|   |                                         |__| |__|   |  |__| |__|                              |
                   E.C(Some(E.B(1)), 2)                       | 1    2|   |                                         | 1    2|   |  | 1    2|                              |
                    |                                         |_______|   |                                         |_______|   |  |_______|                              |
                    |                                         |   3       |                                         |   3       |      3                                  |
                    |                                         |___________|                                         |___________|                                         |
                    |                                             false                                                  true                                             |
                    |_____________________________________________________________________________________________________________________________________________________|
                                                                                               3
     */
    @TestCase
    func testExceptionGuard(): Unit {
        let e = C(B(1), 2)
        let throwing: () -> Bool = {=> throw Exception()}
        let zero = 0
        @PowerAssert(
            match (e) {
                case C(Some(B(i1)), i2) where throwing() => i1 + i2
                case _ => zero
            }, -1
        )
    }

    /* SCAN-IN
    Assert Failed: `({COLOR=GRAY}match ({/COLOR}{COLOR=YELLOW}e{/COLOR}{COLOR=GRAY}) { case C(Some(B(i1)), i2) where {/COLOR}{COLOR=RED}throwing(){/COLOR}{COLOR=GRAY} => i1 + i2; case _ => zero } == - 1{/COLOR})`
                    |      |_|                                |__________|                            |      |
                   E.C(Some(E.B(1)), 2)                        [Exception]                            |      |
                    |_________________________________________________________________________________|      |
                    |                                  [not computed]                                        |
                    |________________________________________________________________________________________|
                                                          [not computed]
     */
    @TestCase
    func testExceptionCondition(): Unit {
        let throwing: () -> Bool = {=> throw Exception()}
        let zero = 0
        @PowerAssert(
            match (throwing()) {
                case true => zero
                case _ => zero
            }, zero
        )
    }

    /* SCAN-IN
    Assert Failed: `({COLOR=GRAY}match ({/COLOR}{COLOR=RED}throwing(){/COLOR}{COLOR=GRAY}) { case true => zero; case _ => zero } == zero{/COLOR})`
                    |      |__________|                                      |       |
                    |       [Exception]                                      |       |
                    |________________________________________________________|       |
                    |                     [not computed]                             |
                    |________________________________________________________________|
                                              [not computed]
     */
    @TestCase
    func testExceptionBranch(): Unit {
        let e = C(B(1), 2)
        let throwing: () -> Int64 = {=> throw Exception()}
        let zero = 0
        @PowerAssert(
            match (e) {
                case C(_, _) => throwing()
                case _ => zero
            }, zero
        )
    }

    /* SCAN-IN
    Assert Failed: `({COLOR=GRAY}match ({/COLOR}{COLOR=YELLOW}e{/COLOR}{COLOR=GRAY}) { case C(_, _) => {/COLOR}{COLOR=RED}throwing(){/COLOR}{COLOR=GRAY}; case _ => zero } == zero{/COLOR})`
                    |      |_|                  |__________|                 |       |
                   E.C(Some(E.B(1)), 2)          [Exception]                 |       |
                    |________________________________________________________|       |
                    |                     [not computed]                             |
                    |________________________________________________________________|
                                              [not computed]
     */
}
