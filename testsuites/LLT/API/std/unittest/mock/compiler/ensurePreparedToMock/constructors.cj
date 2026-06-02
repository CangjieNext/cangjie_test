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

class Foo {}

func case5(): Unit {
    let stubCall1 = @EnsurePreparedToMock {=> return Foo()}
}

/* SCAN-IN
error: static/top-level declaration to mock shouldn't be private, local, constant or constructor
  ==> constructors.cj:18:43:
   | 
18 |     let stubCall1 = @EnsurePreparedToMock {=> return Foo()}
   |                                           ^^^^^^^^^^^^^^^^^ 
   | 

1 error generated, 1 error printed.
 */
