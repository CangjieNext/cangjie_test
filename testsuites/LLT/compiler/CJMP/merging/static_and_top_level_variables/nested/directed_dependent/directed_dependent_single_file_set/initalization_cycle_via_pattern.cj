// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

public common let X: Int = 1
public let Y = X
public common let Z: Int = 2

// SEPARATE-FILE: p/p1.cj
package cmp

public let A = Y

// SEPARATE-FILE: p/p2.cj
// EXEC-PIPE-1: %compiler %noColor --experimental p/p1.cj p/p2.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib 2>&1 | compare %f
package cmp

public specific let (X, Z): (Int64, Int64) = (A, A + 1)

/* SCAN
error: p1.cj and p2.cj and c.cj might have file circular dependency
1 error generated, 1 error printed.
*/
