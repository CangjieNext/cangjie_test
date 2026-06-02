/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f
// EXEC-PIPE-0: %run %run_opt %output --no-color 2>&1 | compare %f

import std.unittest.*
import std.unittest.testmacro.*
import std.collection.*

@Test
public class SomeCases1 {
    @TestCase
    func test1(): Unit {
        println("--A--")
    }
    @TestCase
    func test2(): Unit {
        println("--B--")
    }
}

@Test
public class SomeCases2 {
    @TestCase
    func test1(): Unit {
        println("--C--")
    }
    @TestCase
    func test2(): Unit {
        println("--D--")
    }
}

main(): Unit {
    let sharedSuite = SomeCases2().asTestSuite()
    let g1 = TestGroup.builder("g1").add(SomeCases1().asTestSuite()).add(sharedSuite).build()
    let g2 = TestGroup.builder("g2").add(sharedSuite).build()
    g1.runTests()
    g2.runTests()
    g1.runTests()
}

/* SCAN-IN
--A--
--B--
--C--
--D--
--C--
--D--
--A--
--B--
--C--
--D--
 */
