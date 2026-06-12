// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c -O1
package cmp

common func foo() { 1 }

// SEPARATE-FILE: p/p.cj
// EXEC-PIPE-1: %compiler %noColor --experimental p/p.cj --common-part-chir=c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=chir --output-dir p -O2 2>&1 | compare %f
package cmp

specific func foo() { 2 }

/*SCAN
error: common part is compiled with different optimization level: O1 in common and O2 in the current compilation
1 error generated, 1 error printed.
*/
