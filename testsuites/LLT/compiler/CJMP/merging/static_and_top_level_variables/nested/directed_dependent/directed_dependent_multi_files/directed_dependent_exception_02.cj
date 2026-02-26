// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c1.cj
package cmp

public let X: Int64 = Y

// SEPARATE-FILE: c/c2.cj
// EXEC-0: %compiler %noColor --experimental c/c1.cj c/c2.cj --output-type=chir --output-dir ./c
package cmp

public common let Y: Int64 = 1

// SEPARATE-FILE: p/p1.cj
package cmp

public specific let Y: Int64 = X

// SEPARATE-FILE: p/p2.cj
// EXEC-PIPE-1: %compiler %noColor --experimental p/p1.cj p/p2.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib --output-dir ./p 2>&1 | compare %f
package cmp

/* SCAN
error: p1.cj and c1.cj might have file circular dependency
1 error generated, 1 error printed.
*/
