// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// A specific part compilation into the directory of the common part overwrites the common part cjo.
// Recompiling the specific part against the overwritten cjo must be diagnosed instead of crashing.

// ASSERT: scan-not Internal Compiler Error

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

public common func foo(): Int64

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj --common-part-chir=c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=staticlib --output-dir ./c
package cmp

public specific func foo(): Int64 { 1 }

// SEPARATE-FILE: p2/p.cj
// EXEC-PIPE-1: %compiler %noColor --experimental p2/p.cj --common-part-chir=c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=staticlib --output-dir ./p2 2>&1 | compare %f
/* SCAN-IN
error: cjo file '
*/
/* SCAN-IN
c/cmp.cjo'
*/
/* SCAN-IN
cannot be used as the common part of package 'cmp'
*/
/* SCAN-IN
help: recompile the common part with '--output-type=chir'
*/
/* SCAN-IN
1 error generated, 1 error printed.
*/
package cmp

public specific func foo(): Int64 { 1 }
