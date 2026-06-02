/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f
// EXEC-PIPE-0: %run %run_opt %output --no-color 2>&1 | compare %f
// ASSERT: scan-500 --A--
// ASSERT: scan-242 --B--
// ASSERT: scan-242 --C--
// ASSERT: scan-242 --D--

import std.unittest.*
import std.unittest.testmacro.*

main(): Unit {
    let case1 = UnitTestCase.create("simpleTest") {
        => println("--A--")
    }
    let case2 = UnitTestCase.createParameterized("paramTest", ["B", "C", "D"]) {
        str => println("--${str}--")
    }

    for (i in 0..500) {
        case1.run()
    }

    for (i in 0..242) {
        case2.run()
    }
}
