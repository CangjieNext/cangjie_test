/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: main.cj

// EXEC: %compiler %cmp_opt -Woff=all %compile_lib_opt main.cj -o libmain.%middle --mock=off 2>&1
// EXEC-PIPE-1: %compiler %cmp_opt -Woff=all --test-only %f libmain.%middle -o %output 2>&1 | compare %f

package default

import std.unittest.*
import std.unittest.testmacro.*
import std.unittest.mock.*
import std.unittest.mock.mockmacro.*

@Test
func toplevelFunc() {
    @On(fnc()).returns(54)
    @Assert(fnc(), 54)
}

@Test
func toplevelConst() {
    @On(cnst).returns(54)
    @Assert(cnst, 54)
}

@Test
func toplevelVarAccess() {
    @On(vr).returns(54)
    @Assert(vr, 54)
}

@Test
func toplevelVarAssign() {
    @On(vr = _).doesNothing()
    vr = 54
    @Assert(vr, 42)
}

@Test
func staticFunc() {
    @On(C.fnc()).returns(54)
    @Assert(C.fnc(), 54)
}

@Test
func staticConst() {
    @On(C.cnst).returns(54)
    @Assert(C.cnst, 54)
}

@Test
func staticVarAccess() {
    @On(C.vr).returns(54)
    @Assert(C.vr, 54)
}

@Test
func staticVarAssign() {
    @On(C.vr = _).doesNothing()
    C.vr = 54
    @Assert(C.vr, 42)
}

/* SCAN-IN
error: 'fnc' doesn't support mocking, please be sure that its package 'default' is mock-compatible (was compiled with --mock=on compilation option)
  ==> main_test.cj:22:9:
   | 
22 |     @On(fnc()).returns(54)
   |         ^ 
   | 
*/

/* SCAN-IN
error: 'cnst' doesn't support mocking, please be sure that its package 'default' is mock-compatible (was compiled with --mock=on compilation option)
  ==> main_test.cj:28:9:
   | 
28 |     @On(cnst).returns(54)
   |         ^ 
   | 
*/

/* SCAN-IN
error: 'vr' doesn't support mocking, please be sure that its package 'default' is mock-compatible (was compiled with --mock=on compilation option)
  ==> main_test.cj:34:9:
   | 
34 |     @On(vr).returns(54)
   |         ^ 
   | 
*/

/* SCAN-IN
error: 'vr' doesn't support mocking, please be sure that its package 'default' is mock-compatible (was compiled with --mock=on compilation option)
  ==> main_test.cj:40:9:
   | 
40 |     @On(vr = _).doesNothing()
   |         ^ 
   | 
*/

/* SCAN-IN
error: 'fnc' doesn't support mocking, please be sure that its package 'default' is mock-compatible (was compiled with --mock=on compilation option)
  ==> main_test.cj:47:9:
   | 
47 |     @On(C.fnc()).returns(54)
   |         ^ 
   | 
*/

/* SCAN-IN
error: 'cnst' doesn't support mocking, please be sure that its package 'default' is mock-compatible (was compiled with --mock=on compilation option)
  ==> main_test.cj:53:9:
   | 
53 |     @On(C.cnst).returns(54)
   |         ^ 
   | 
*/

/* SCAN-IN
error: 'vr' doesn't support mocking, please be sure that its package 'default' is mock-compatible (was compiled with --mock=on compilation option)
  ==> main_test.cj:59:9:
   | 
59 |     @On(C.vr).returns(54)
   |         ^ 
   | 
*/

/* SCAN-IN
error: 'vr' doesn't support mocking, please be sure that its package 'default' is mock-compatible (was compiled with --mock=on compilation option)
  ==> main_test.cj:65:9:
   | 
65 |     @On(C.vr = _).doesNothing()
   |         ^ 
   | 
*/
