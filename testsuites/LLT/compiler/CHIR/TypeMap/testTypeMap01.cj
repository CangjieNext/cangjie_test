// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC:%compiler %n.cj %cmp_utest_opt
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import std.unittest.*
import std.unittest.testmacro.*

@Test
func foo1(): Unit {
    println("foo1")
    @Assert(0 == 1)
}
