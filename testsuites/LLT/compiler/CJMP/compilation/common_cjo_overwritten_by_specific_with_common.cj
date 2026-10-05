// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// A specific part with an additional 'common' decl writes a cjo with CJMP file info, but it is still not
// a common part. When it overwrites the common part cjo, recompiling the specific part against it
// must be diagnosed instead of crashing on the mismatch with the common part chir.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

public common func foo(): Int64

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj --common-part-chir=c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=staticlib --output-dir ./c
// EXEC-PIPE-1: %compiler %noColor --experimental p2/p.cj --common-part-chir=c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=staticlib --output-dir ./p 2>&1 | compare %f
// ASSERT: scan error: cjo file '
// ASSERT: scan c/cmp.cjo' passed as the common part of package 'cmp' was not produced by a common part compilation
// ASSERT: scan note: only a cjo produced with '--output-type=chir' by this or a newer cjc is a common part
// ASSERT: scan help: recompile the common part with '--output-type=chir'
// ASSERT: scan 1 error generated, 1 error printed.
package cmp

public specific func foo(): Int64 { 1 }

public common func fallback(): Int64 { 7 }

// SEPARATE-FILE: p2/p.cj
package cmp

public specific func foo(): Int64 { 1 }
