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
public class TS3 {
    @BeforeEach
    func be(name: String) {
        println("--BE4: ${name}--")
    }

    @AfterAll
    func aa() {
        println("--AA2--")
    }

    @TestCase
    func TC4(): Unit {
        println("--TC4--")
    }

    @TestCase
    func TC5(): Unit {
        println("--TC5--")
    }
}

main(): Unit {
    let ts1 = TestSuite
        .builder("s1")
        .beforeAll {println("--BA1--")}
        .beforeAll {=> println("--BA2--")}
        .beforeEach {name => println("--BE1: ${name}--")}
        .afterEach {=> println("--AE1--")}
        .afterEach {name => println("--AE2: ${name}--")}
        .afterAll {=> println("--AA1--")}
        .add(UnitTestCase.create("TC1") {=> println("--TC1--")})
        .add(UnitTestCase.create("TC2") {=> println("--TC2--")})
        .build()
    ts1.runTests()

    println("------------")

    TestSuite
        .builder(ts1)
        .setName("s2")
        .beforeEach {=> println("--BE2--")}
        .add(UnitTestCase.create("TC3") {=> println("--TC3--")})
        .build()
        .runTests()

    println("------------")
    TestSuite
        .builder(TS3().asTestSuite())
        .setName("s3")
        .beforeEach {=> println("--BE3--")}
        .add(UnitTestCase.create("TC3") {=> println("--TC3--")})
        .build()
        .runTests()
}

/* SCAN-IN
--BA1--
--BA2--
--BE1: TC1--
--TC1--
--AE1--
--AE2: TC1--
--BE1: TC2--
--TC2--
--AE1--
--AE2: TC2--
--AA1--
------------
--BA1--
--BA2--
--BE1: TC1--
--BE2--
--TC1--
--AE1--
--AE2: TC1--
--BE1: TC2--
--BE2--
--TC2--
--AE1--
--AE2: TC2--
--BE1: TC3--
--BE2--
--TC3--
--AE1--
--AE2: TC3--
--AA1--
------------
--BE4: TC4--
--BE3--
--TC4--
--BE4: TC5--
--BE3--
--TC5--
--BE4: TC3--
--BE3--
--TC3--
--AA2--
 */
