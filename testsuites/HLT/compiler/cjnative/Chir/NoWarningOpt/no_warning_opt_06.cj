/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_opt %f  --package dsa -o %output  --warn-off all
// ASSERT: scan-not warning

import std.unittest.*
import std.unittest.testmacro.*

@Test
class A {
    @TestCase
    func foo1(): Unit {
        var a = 1
    }
}

main() {
    return 0
}
