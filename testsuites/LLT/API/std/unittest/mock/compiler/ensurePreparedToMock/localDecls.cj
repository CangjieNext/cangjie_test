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

private func ff() {
    ""
}

func case5(): Unit {
    func foo() {
        ""
    }
    let a = 1
    let stubCall1 = @EnsurePreparedToMock {=> return foo()}
    let stubCall2 = @EnsurePreparedToMock {=> return a}
    func bar() {
        let stubCall11 = @EnsurePreparedToMock {=> return foo()}
        let stubCall21 = @EnsurePreparedToMock {=> return a}
    }
}

/* SCAN-IN
error: static/top-level declaration to mock shouldn't be private, local, constant or constructor
  ==> localDecls.cj:24:43:
   | 
24 |     let stubCall1 = @EnsurePreparedToMock {=> return foo()}
   |                                           ^^^^^^^^^^^^^^^^^ 
   | 

error: static/top-level declaration to mock shouldn't be private, local, constant or constructor
  ==> localDecls.cj:25:43:
   | 
25 |     let stubCall2 = @EnsurePreparedToMock {=> return a}
   |                                           ^^^^^^^^^^^^^ 
   | 

error: static/top-level declaration to mock shouldn't be private, local, constant or constructor
  ==> localDecls.cj:27:48:
   | 
27 |         let stubCall11 = @EnsurePreparedToMock {=> return foo()}
   |                                                ^^^^^^^^^^^^^^^^^ 
   | 

error: static/top-level declaration to mock shouldn't be private, local, constant or constructor
  ==> localDecls.cj:28:48:
   | 
28 |         let stubCall21 = @EnsurePreparedToMock {=> return a}
   |                                                ^^^^^^^^^^^^^ 
   | 

4 errors generated, 4 errors printed.
 */
