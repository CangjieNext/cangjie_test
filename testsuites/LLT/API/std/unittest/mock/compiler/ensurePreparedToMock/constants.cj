/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC-PIPE-1: %compiler %cmp_opt -Woff=all %n.cj -o %output %cmp_utest_opt --mock=on 2>&1 | compare %f

import std.unittest.*
import std.unittest.testmacro.*
import std.unittest.mock.*
import std.unittest.mock.mockmacro.*

const a = "abc"

class Foo {
    static const b = "pla"
}

abstract class Bar {
    static const b = "pla"
}

class Boo <: Bar {}

func case5(): Unit {
    let stubCall1 = @EnsurePreparedToMock {=> return (a)}
    let stubCall2 = @EnsurePreparedToMock {=> return Boo.b}
}

/* SCAN-IN
error: static/top-level declaration to mock shouldn't be private, local, constant or constructor
  ==> constants.cj:28:43:
   | 
28 |     let stubCall1 = @EnsurePreparedToMock {=> return (a)}
   |                                           ^^^^^^^^^^^^^^^ 
   | 

error: static/top-level declaration to mock shouldn't be private, local, constant or constructor
  ==> constants.cj:29:43:
   | 
29 |     let stubCall2 = @EnsurePreparedToMock {=> return Boo.b}
   |                                           ^^^^^^^^^^^^^^^^^ 
   | 

2 errors generated, 2 errors printed.
 */
