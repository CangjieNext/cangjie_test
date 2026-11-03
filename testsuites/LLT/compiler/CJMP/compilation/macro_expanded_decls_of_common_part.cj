// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Decls expanded from a macro in the common part, e.g. the extend of 'TestPackage' from '@Test', have positions
// which are not in a file of the common part. They must stay in their common part file when the specific part is
// compiled, so that their CHIR is found in the common part chir. The macro is in the second common part file
// to check the index of the file.

// SEPARATE-FILE: c/a.cj
package cmp

public common func foo(): Int64

public func fromCommonA(): Int64 { 1 }

// SEPARATE-FILE: c/b.cj
// EXEC-0: %compiler %noColor --experimental c/a.cj c/b.cj --output-type=chir --output-dir ./c
package cmp

import std.unittest.*
import std.unittest.testmacro.*

@Test
func commonTest() {
    @Expect(foo() + fromCommonA(), 3)
}

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental --test p/p.cj --common-part-chir=c/cmp.chir --common-part-cjo=./c/cmp.cjo -o %output
// RUN: %run %output --no-color 2>&1 | compare %f
package cmp

import std.unittest.*
import std.unittest.testmacro.*

public specific func foo(): Int64 { 2 }

@Test
func specificTest() {
    @Expect(foo(), 2)
}

/* SCAN-IN
[ PASSED ] CASE: commonTest
*/
/* SCAN-IN
[ PASSED ] CASE: specificTest
*/
/* SCAN-IN
FAILED: 0
*/
