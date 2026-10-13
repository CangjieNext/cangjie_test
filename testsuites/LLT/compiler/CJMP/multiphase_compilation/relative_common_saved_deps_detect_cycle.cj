// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Edges introduced at a relative-common stage must be SaveCJMPDependencies'd
// into the emitted common part. Without outputCHIR at that stage, product
// compilation misses `b -> a` and fails to report the circular dependency.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

public common let a: Int64 = 1

// SEPARATE-FILE: p1/p1.cj
// EXEC-0: %compiler %noColor --experimental p1/p1.cj --common-part-chir=c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-dir=p1 --output-type=chir
package cmp

public common let b: Int64 = a + 1

// SEPARATE-FILE: p2/p2.cj
// EXEC-PIPE-1: %compiler %noColor --experimental p2/p2.cj --common-part-chir=p1/cmp.chir --common-part-cjo=./p1/cmp.cjo --output-type=dylib 2>&1 | compare %f
package cmp

public specific let a: Int64 = b

/* SCAN
error: p2.cj and p1.cj might have file circular dependency
1 error generated, 1 error printed.
*/
