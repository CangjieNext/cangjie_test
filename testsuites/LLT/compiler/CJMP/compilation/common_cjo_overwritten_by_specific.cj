// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// A specific part compilation into the directory of the common part overwrites the common part cjo and warns about it.
// Recompiling the specific part against the overwritten cjo must be diagnosed instead of crashing.

// ASSERT: scan-not Internal Compiler Error

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

public common func foo(): Int64

// SEPARATE-FILE: p/p.cj
// EXEC-PIPE-0: %compiler %noColor --experimental p/p.cj --common-part-chir=c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=staticlib --output-dir ./c 2>&1 | compare %f
/* SCAN-IN
warning: output cjo file '
*/
/* SCAN-IN
overwrites the common part cjo passed with '--common-part-cjo'
*/
/* SCAN-IN
note: the overwritten cjo is no longer a common part and cannot be passed with '--common-part-cjo' again
*/
/* SCAN-IN
help: write the output to a different directory with '--output-dir' to keep the common part
*/
package cmp

public specific func foo(): Int64 { 1 }

// SEPARATE-FILE: p2/p.cj
// EXEC-PIPE-1: %compiler %noColor --experimental p2/p.cj --common-part-chir=c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=staticlib --output-dir ./p2 2>&1 | compare %f
/* SCAN-IN
error: cjo file '
*/
/* SCAN-IN
c/cmp.cjo' cannot be used as the common part of package 'cmp'
*/
/* SCAN-IN
note: this cjo was not produced by a common part compilation with '--output-type=chir'
*/
/* SCAN-IN
help: recompile the common part with '--output-type=chir' and keep its '.cjo' and '.chir' together in a separate directory, e.g. with '--output-dir'
*/
/* SCAN-IN
1 error generated, 1 error printed.
*/
package cmp

public specific func foo(): Int64 { 1 }

// SEPARATE-FILE: with_common/c/c.cj
// EXEC-0: %compiler %noColor --experimental with_common/c/c.cj --output-type=chir --output-dir ./with_common/c
package cmp

public common func foo(): Int64

// SEPARATE-FILE: with_common/p/p.cj
// EXEC-PIPE-0: %compiler %noColor --experimental with_common/p/p.cj --common-part-chir=with_common/c/cmp.chir --common-part-cjo=with_common/c/cmp.cjo --output-type=staticlib --output-dir ./with_common/c 2>&1 | compare %f
/* SCAN-IN
warning: output cjo file '
*/
/* SCAN-IN
overwrites the common part cjo passed with '--common-part-cjo'
*/
package cmp

public specific func foo(): Int64 { 1 }
public common func fallback(): Int64 { 7 }

// The overwriting compilation also has 'common' declarations, but the marker follows '--output-type=chir',
// so the overwritten cjo is still not a common part and must be rejected instead of crashing.
// SEPARATE-FILE: with_common/p2/p.cj
// EXEC-PIPE-1: %compiler %noColor --experimental with_common/p2/p.cj --common-part-chir=with_common/c/cmp.chir --common-part-cjo=with_common/c/cmp.cjo --output-type=staticlib --output-dir ./with_common/p2 2>&1 | compare %f
/* SCAN-IN
error: cjo file '
*/
/* SCAN-IN
cannot be used as the common part of package 'cmp'
*/
/* SCAN-IN
note: this cjo was not produced by a common part compilation with '--output-type=chir'
*/
/* SCAN-IN
note: a specific part compilation writes 'cmp.cjo' to its output directory and may have overwritten the common part cjo
*/
/* SCAN-IN
help: recompile the common part with '--output-type=chir' and keep its '.cjo' and '.chir' together in a separate directory, e.g. with '--output-dir'
*/
/* SCAN-IN
1 error generated, 1 error printed.
*/
package cmp

public specific func foo(): Int64 { 1 }
