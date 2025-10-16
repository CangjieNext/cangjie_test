// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

public common let X1: Int64 = 1
public common let X2: Int64 = X1
public common let X3: Int64 = X2

public let (Y1, Y2): (Int64, Int64) = (1, 2)

// SEPARATE-FILE: p/p.cj
// EXEC-PIPE-1: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib 2>&1 | compare %f
package cmp

// p.cj -> c.cj via Y1
// c.cj -> p.cj via X3 -> X2
public platform let (X1, X2): (Int64, Int64) = (Y1, Y2)

/* SCAN
error: p.cj and c.cj might have file circular dependency
1 error generated, 1 error printed.
*/
