// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// The '.cjo' and '.chir' of a common part must come from the same compilation. A pair mixed from two
// common part compilations of the same package must be diagnosed at cjo load instead of crashing.

// ASSERT: scan-not Internal Compiler Error

// SEPARATE-FILE: v1/c.cj
// EXEC-0: %compiler %noColor --experimental v1/c.cj --output-type=chir --output-dir ./v1
package demo

public common func foo(): Int64

// SEPARATE-FILE: v2/c.cj
// EXEC-0: %compiler %noColor --experimental v2/c.cj --output-type=chir --output-dir ./v2
package demo

public common func foo(): Int64

public common func extra(): Int64 { 2 }

// SEPARATE-FILE: p/p.cj
// EXEC-PIPE-1: %compiler %noColor --experimental p/p.cj --common-part-cjo=./v2/demo.cjo --common-part-chir=v1/demo.chir --output-type=staticlib --output-dir ./p 2>&1 | compare %f
/* SCAN-IN
error: common part cjo file '
*/
/* SCAN-IN
does not match any common part chir file passed with '--common-part-chir'
*/
/* SCAN-IN
note: the '.cjo' and '.chir' must come from the same common part compilation
*/
/* SCAN-IN
help: recompile the common part with '--output-type=chir' and pass both its '.cjo' and '.chir'
*/
/* SCAN-IN
1 error generated, 1 error printed.
*/
package demo

public specific func foo(): Int64 { 1 }

// The same mismatch in the other direction: the '.chir' has a declaration which its '.cjo' does not have.
// SEPARATE-FILE: p2/p.cj
// EXEC-PIPE-1: %compiler %noColor --experimental p2/p.cj --common-part-cjo=./v1/demo.cjo --common-part-chir=v2/demo.chir --output-type=staticlib --output-dir ./p2 2>&1 | compare %f
/* SCAN-IN
error: common part cjo file '
*/
/* SCAN-IN
does not match any common part chir file passed with '--common-part-chir'
*/
/* SCAN-IN
note: the '.cjo' and '.chir' must come from the same common part compilation
*/
/* SCAN-IN
1 error generated, 1 error printed.
*/
package demo

public specific func foo(): Int64 { 1 }
