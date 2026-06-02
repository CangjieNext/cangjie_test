/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan foobar

import std.unittest.*
import std.unittest.testmacro.*

@Test
class DemoTest {
    @TestCase
    func testDemo(): Unit {
        let foo = "foo"
        let bar = "${foo + "bar"}"
        println("${bar}")
    }
}

main() {
    let foo = "foo"
    let bar = "${foo + "bar"}"
    println("${bar}")
}
