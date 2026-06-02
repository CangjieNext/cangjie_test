/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output %cmp_utest_opt 2>&1| compare %f

import std.unittest.mock.mockmacro.*
import std.unittest.mock.*

class Foo {
    func bar(i: Int64): Unit {}
}

func use() {
    let foo = mock<Foo>()
    @On(foo.bar())
}

/* SCAN-IN
error: missing argument for parameter list '(Int64)' in call
 */
