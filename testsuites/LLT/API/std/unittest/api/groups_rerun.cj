/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f
// EXEC-PIPE-0: %run %run_opt %output --no-color 2>&1 | compare %f
// ASSERT: scan-386 --A--
// ASSERT: scan-386 --B--
// ASSERT: scan-386 --C--
// ASSERT: scan-386 --D--

import std.unittest.*
import std.unittest.testmacro.*

main(): Unit {
    let group = TestGroup
        .builder("g")
        .add(TestSuite.builder("s1").add(UnitTestCase.create("simpleTest") {=> println("--A--")}).build())
        .add(
            TestSuite
                .builder("s2")
                .add(UnitTestCase.createParameterized("paramTest", ["B", "C", "D"]) {
                    str => println("--${str}--")
                })
                .build())
        .build()

    for (i in 0..386) {
        group.runTests()
    }
}
