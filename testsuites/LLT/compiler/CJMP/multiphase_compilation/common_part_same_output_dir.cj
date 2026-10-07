// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// An intermediate CHIR stage may replace its input pair without an overwrite warning.
// ASSERT: scan-not warning:
// ASSERT: scan-not Internal Compiler Error

// SEPARATE-FILE: common/c.cj
// EXEC-0: %compiler %noColor --experimental common/c.cj --output-type=chir --output-dir ./common
package cmp

public common func foo(): Int64
public common func bar(): Int64

// SEPARATE-FILE: mid.cj
// EXEC-PIPE-0: %compiler %noColor --experimental mid.cj --common-part-cjo=common/cmp.cjo --common-part-chir=common/cmp.chir --output-type=chir --output-dir ./common 2>&1 | compare %f
package cmp

public specific func foo(): Int64 { 1 }

// SEPARATE-FILE: p.cj
// EXEC-0: %compiler %noColor --experimental p.cj --common-part-cjo=common/cmp.cjo --common-part-chir=common/cmp.chir -o %output
// EXEC-PIPE-0: %run %output 2>&1 | compare %f
/* SCAN
3
*/
package cmp

public specific func bar(): Int64 { 2 }

main() {
    println(foo() + bar())
}
