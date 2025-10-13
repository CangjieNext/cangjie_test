/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output %cmp_utest_opt 2>&1 | compare %f

import std.unittest.mock.mockmacro.*
import std.unittest.mock.*

class Foo {
    var x: Int64 = 0
}

func use() {
    let foo = mock<Foo>()
    let synheticField = SyntheticField.create(initialValue: "str")

    @On(foo.x = _).setsField(synheticField)

    @On(foo.x).getsField(synheticField)
}

/* SCAN-IN
error: mismatched types
  ==> field_type_mismatch.cj:21:30:
   | 
21 |     @On(foo.x = _).setsField(synheticField)
*/

/* SCAN-IN
error: mismatched types
  ==> field_type_mismatch.cj:23:26:
   | 
23 |     @On(foo.x).getsField(synheticField)
*/
